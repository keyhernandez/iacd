package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(TarjetaController)
@Mock(Tarjeta)
class TarjetaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tarjeta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tarjetaInstanceList.size() == 0
        assert model.tarjetaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tarjetaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tarjetaInstance != null
        assert view == '/tarjeta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tarjeta/show/1'
        assert controller.flash.message != null
        assert Tarjeta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjeta/list'

        populateValidParams(params)
        def tarjeta = new Tarjeta(params)

        assert tarjeta.save() != null

        params.id = tarjeta.id

        def model = controller.show()

        assert model.tarjetaInstance == tarjeta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjeta/list'

        populateValidParams(params)
        def tarjeta = new Tarjeta(params)

        assert tarjeta.save() != null

        params.id = tarjeta.id

        def model = controller.edit()

        assert model.tarjetaInstance == tarjeta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjeta/list'

        response.reset()

        populateValidParams(params)
        def tarjeta = new Tarjeta(params)

        assert tarjeta.save() != null

        // test invalid parameters in update
        params.id = tarjeta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tarjeta/edit"
        assert model.tarjetaInstance != null

        tarjeta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tarjeta/show/$tarjeta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tarjeta.clearErrors()

        populateValidParams(params)
        params.id = tarjeta.id
        params.version = -1
        controller.update()

        assert view == "/tarjeta/edit"
        assert model.tarjetaInstance != null
        assert model.tarjetaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tarjeta/list'

        response.reset()

        populateValidParams(params)
        def tarjeta = new Tarjeta(params)

        assert tarjeta.save() != null
        assert Tarjeta.count() == 1

        params.id = tarjeta.id

        controller.delete()

        assert Tarjeta.count() == 0
        assert Tarjeta.get(tarjeta.id) == null
        assert response.redirectedUrl == '/tarjeta/list'
    }
}
