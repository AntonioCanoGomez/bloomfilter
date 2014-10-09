#ifndef BLOOMFILTERS_H
#define BLOOMFILTERS_H


#include <QObject>
#include "svn/bloom-read-only/bloom_filter.hpp"

class Bloomfilters : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bloom_parameters parameters READ parameters WRITE setParameters NOTIFY parametersChanged)
    Q_PROPERTY(bloom_filter filter READ filter WRITE setFilter NOTIFY filterChanged)
    Q_PROPERTY(bool filterCharged READ filterCharged WRITE setFilterCharged NOTIFY filterChargedChanged)
    Q_PROPERTY(QString k READ k WRITE setk NOTIFY kChanged)

public:
    explicit Bloomfilters(QObject *parent = 0);

    void generateFilter() ;

    void insertElement(std::string palabra) ;


    bool checkElement(std::string palabra) ;

    bloom_parameters parameters();
    void setParameters(const bloom_parameters &p);

    bloom_filter filter();
    void setFilter(const bloom_filter &f);

    bool filterCharged();
    void setFilterCharged(const bool &f);


    QString  k();
    void setk(const QString &f);


signals:
    void parametersChanged() ;
    void filterChanged() ;
    void filterChargedChanged() ;
    void kChanged() ;

public slots:

private:
    bloom_parameters _parameters ;
    bloom_filter _filter;
    bool _filter_charged;
    QString _k;
};

#endif // BLOOMFILTERS_H
