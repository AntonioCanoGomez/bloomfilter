#include "bloomfilters.h"
//#include <string>

Bloomfilters::Bloomfilters(QObject *parent) :
    QObject(parent) , _parameters() , _filter(_parameters) , _filter_charged()
{
    _filter_charged=false;
}


void Bloomfilters::generateFilter() {

//    _parameters;

    delete &(_parameters);

    bloom_parameters _parameters;

    QByteArray k2 = _k.toLatin1();
    const char *k3 = k2.data();
    _parameters.maximum_number_of_hashes=atoi(k3);
    _parameters.minimum_number_of_hashes=atoi(k3);
    _parameters.maximum_size = strtoull (k3, NULL, 10);
    _parameters.minimum_size = strtoull (k3, NULL, 10);

    _parameters.projected_element_count = 1000;

    // Maximum tolerable false positive probability? (0,1)
    _parameters.false_positive_probability = 0.0001; // 1 in 10000

    // Simple randomizer (optional)
    _parameters.random_seed = 0xA5A5A5A5;

    if (!_parameters)
    {
    }

    _parameters.compute_optimal_parameters();


//     _filter=bloom_filter::bloom_filter(_parameters);
//    _filter(_parameters);
    delete &(_filter) ;
    bloom_filter _filter(_parameters);
    _filter_charged=true;
}


void Bloomfilters::insertElement(std::string palabra) {
     _filter.insert(palabra);
}


bool Bloomfilters::checkElement(std::string palabra) {
     return _filter.contains(palabra);
}

bloom_parameters Bloomfilters::parameters() {
    return _parameters;
}

void Bloomfilters::setParameters(const bloom_parameters &p) {
//    if (p != _parameters) {
        _parameters = p;
        emit parametersChanged();
//    }
}

bloom_filter Bloomfilters::filter() {
        return _filter;
}

void Bloomfilters::setFilter(const bloom_filter &f) {
    if (f != _filter) {
        _filter = f;
        emit parametersChanged();
    }
}


bool Bloomfilters::filterCharged() {
        return _filter_charged;
}

void Bloomfilters::setFilterCharged(const bool &f) {
    if (f != _filter_charged) {
        _filter_charged = f;
        emit filterChargedChanged();
    }
}

QString Bloomfilters::k() {
        return _k;
}

void Bloomfilters::setk(const QString  &f) {
    if (f != _k) {
        _k = f;
        emit kChanged();
    }
}
