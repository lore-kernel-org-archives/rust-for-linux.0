Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394DF3947B1
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994602; cv=none; b=Oh3oM+izfw2TW4EA0IEaBSbjqdQ1Ve+qJZZw+SfBK+l4IYKyJB2hJC0KwCUvUszsecQ5BTO4QL6X/Gk6R8/pJ5I+3MMylH0IXtbOZLEK+sruXGqoRafZxVbAaPW9XPZi7AsvNjrME0s0vUSrmR50d3yuvHzfrcvVh5/QIbOLHu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994602; c=relaxed/simple;
	bh=pIv/9ZgoBxDrBm5rPMsiPxLwGdJumz/WE+ArWAUOu1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKJ0fS2CPkOKDZlknkCSf8nP8cRvMXA+4PYNmIXPj/Q2udfN2q5NvdeBUOFnXKhb5Tpz6jT8rlKPwG5lySV/8bHWNGROsMErLkxazJMYWfTAgfH+BiQ++xksD99JXd1VhCKEkTREbX3k1dK/DopWLGP1NO1EUjoLqDqHoQ9e1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGAEtRB1; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGAEtRB1"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127380532eeso8393704c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 11:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772994600; x=1773599400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aa3vZ7DZkZw77S+VSM83ezPPgKZH5tCCD1FMOqakeE=;
        b=aGAEtRB1tf7VW8qWXwZpDA3ItlmlRjaznuLmwJqwYcAOBAt5QYTlMF8DNI82SNixjz
         8RpXden7qXqo3M3qYLtBcf2T2iaUUkm8PjXGIsqBfegcOOkI5b1ZvHnNaxXg1HzyP4Ft
         JeGjLrNP7zq+v3IPCRAuj52NMvKgdvJCKDp7oWN9fjCDZ9ZskcshFv2OTVMw18Deb3PP
         LmAcBXaPA/GIseJUOdzqvtWHHuQo5Fuz2MUIwLIkt84wUY3DLulCu4K37WCMGlonvSi5
         sOiWr5+Z5i6/L7xni3lhtotmk3HF4BauG7iHA0B1xy+RJEwAlyzrXLEBXg9DNxoBNS3B
         NPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994600; x=1773599400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aa3vZ7DZkZw77S+VSM83ezPPgKZH5tCCD1FMOqakeE=;
        b=vJD9nw/um6VnlyyalXGAbz3eLMuzPl6SnKe/dw2xjA31JojhwYPE01553hSYIrBsqN
         PbCyYaAXU36vpZBzu7xuwg3pSyB6Y+TqRtmYQyD39/0zLzu3yzHFFwovL/ip8NW28myt
         608h/NMzrLtRjQmmLJ/U9HDEzbekzaYbqNiK8pg0/Q3HbdGID6pMEuiarOPc771bfvfT
         Mx//27R6xI1njCc6inDIhn0kDGLnW5AezeMZgPoaTT6wXgQ46nsYsHHt5oo0SDMIDz5f
         3qnVJnHdi9qGOF794lFOH8e5qs8VqyAd1GmpdKkt75EgT5pci83XVH4DbV6i8MEUj8/V
         Bjtg==
X-Forwarded-Encrypted: i=1; AJvYcCUFeVC7KNRzV/gF6FT7O149woAqR1U3L1jStUvDxUE2n3AnU9VotQrMeX+64QRPYfSAXTV3i1klUjWHbphqLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuTJ1D+xLtSJvzUaRcDhhkldOGLw7gRJYSs8dT9wxPB4TIJnA
	fntyB9ppXX//HKK10T8906CRtlLj3erwzUbvCAhccoQEkcwVszr8JN6y
X-Gm-Gg: ATEYQzzFmSUJFYwBeBiizBmkMNlGzAUE6d3mnE1VQUNvqezSZSKQ36UQEkuu72GDuF/
	RI4cn/PA5gMCt29JNSfcBx7mpDA7nfSWsPDbiBU20MLD0HZH4EBKblSluvbgeygYKEVkMh5IkGa
	StKWfSvvVwUn098B8AFLGgiCymQRh1tsIr7wDHowCquQP1KEwBNtJxMEU4vvWR+3dTwZzzpvxE7
	uvvzostXmeNudCooZkpka8v9x7v2J37pCbRhr9uwiPNBRgPVPrw8kiXrM13Zn/SRM9YuwQ4O4p+
	T0bRwmupZDVUdAGsXmCiba8FGVk+xZZLRWNf3iIoRfpL8ZxgPI2QMXOT3EoLEHHW5JBgG6pVO7w
	BGKUqiYzTNUzAqa8IqoTL4qyIpKygVni4W9tqJeBNKAytYuPdLszBxCLSEsgmcaIwqvzmYSVkjG
	twseK2LoOw9LkzdQYw4u1YIcc4aY1pxFTS5YRfOPZU
X-Received: by 2002:a05:7022:6721:b0:122:2f4:b24b with SMTP id a92af1059eb24-128c2e7f5b6mr3713152c88.25.1772994600193;
        Sun, 08 Mar 2026 11:30:00 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f59566sm6468019c88.14.2026.03.08.11.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:29:59 -0700 (PDT)
Message-ID: <0e3020ce-d48a-4768-a07d-de12ac24ae35@gmail.com>
Date: Sun, 8 Mar 2026 11:29:59 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs: sp_SP: Add Spanish translation for Rust
 quick-start
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-2-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-2-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 12:07, Edwin Toribio wrote:

> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>


  Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   .../translations/sp_SP/rust/quick-start.rst   | 384 ++++++++++++++++++
>   1 file changed, 384 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
> new file mode 100644
> index 000000000..276b81971
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/rust/quick-start.rst
> @@ -0,0 +1,384 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: Documentation/rust/quick-start.rst
> +:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
> +
> +.. _sp_rust_quick_start:
> +
> +Guía de inicio rápido
> +=====================
> +
> +Este documento describe cómo empezar con el desarrollo del kernel en Rust.
> +
> +Existen varias formas de instalar el conjunto de herramientas (toolchain) de Rust
> +necesario para el desarrollo del kernel. Una forma sencilla es utilizar los
> +paquetes de su distribución de Linux si son adecuados; la primera sección a
> +continuación explica este enfoque. Una ventaja de este método es que,
> +normalmente, la distribución hará coincidir el LLVM utilizado por Rust y Clang.
> +
> +Otra forma es utilizar las versiones estables precompiladas de LLVM+Rust
> +proporcionadas en `kernel.org <https://kernel.org/pub/tools/llvm/rust/>`_.
> +Estas son las mismas herramientas de LLVM ligeras y rápidas de
> +:ref:`Obtener LLVM <getting_llvm>` con versiones de Rust añadidas que son
> +compatibles con Rust para Linux. Se proporcionan dos conjuntos: el "LLVM más
> +reciente" (latest LLVM) y el "LLVM coincidente" (matching LLVM) (consulte el
> +enlace para más información).
> +
> +Alternativamente, las dos secciones siguientes de "Requisitos" explican cada
> +componente y cómo instalarlos a través de ``rustup``, los instaladores
> +independientes de Rust y/o compilándolos.
> +
> +El resto del documento explica otros aspectos sobre cómo empezar.
> +
> +
> +Distribuciones
> +--------------
> +
> +Arch Linux
> +**********
> +
> +Arch Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, p. ej.::
> +
> +    pacman -S rust rust-src rust-bindgen
> +
> +
> +Debian
> +******
> +
> +Debian 13 (Trixie), así como Testing y Debian Unstable (Sid) proporcionan
> +versiones recientes de Rust y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +
> +Fedora Linux
> +************
> +
> +Fedora Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, p. ej.::
> +
> +    dnf install rust rust-src bindgen-cli rustfmt clippy
> +
> +
> +Gentoo Linux
> +************
> +
> +Gentoo Linux (y especialmente la rama de pruebas) proporciona versiones
> +recientes de Rust y, por lo tanto, debería funcionar directamente, p. ej.::
> +
> +    USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
> +
> +Es posible que sea necesario configurar ``LIBCLANG_PATH``.
> +
> +
> +Nix
> +***
> +
> +Nix (canal unstable) proporciona versiones recientes de Rust y, por lo tanto,
> +debería funcionar directamente, p. ej.::
> +
> +    { pkgs ? import <nixpkgs> {} }:
> +    pkgs.mkShell {
> +      nativeBuildInputs = with pkgs; [ rustc rust-bindgen rustfmt clippy ];
> +      RUST_LIB_SRC = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
> +    }
> +
> +
> +openSUSE
> +********
> +
> +openSUSE Slowroll y openSUSE Tumbleweed proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    zypper install rust rust1.79-src rust-bindgen clang
> +
> +
> +Ubuntu
> +******
> +
> +25.04
> +~~~~~
> +
> +Las versiones más recientes de Ubuntu proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, p. ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +Además, es necesario configurar ``RUST_LIB_SRC``, p. ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +
> +24.04 LTS y anteriores
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Aunque Ubuntu 24.04 LTS y versiones anteriores todavía proporcionan versiones
> +recientes de Rust, requieren que se establezca alguna configuración adicional,
> +utilizando los paquetes con versión, p. ej.::
> +
> +    apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
> +        rust-1.80-clippy
> +    ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
> +    ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
> +
> +Ninguno de estos paquetes establece sus herramientas como predeterminadas; por
> +lo tanto, deben especificarse explícitamente, p. ej.::
> +
> +    make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
> +        CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
> +
> +Alternativamente, modifique la variable ``PATH`` para colocar los binarios de
> +Rust 1.80 primero y establezca ``bindgen`` como predeterminado, p. ej.::
> +
> +    PATH=/usr/lib/rust-1.80/bin:$PATH
> +    update-alternatives --install /usr/bin/bindgen bindgen \
> +        /usr/bin/bindgen-0.65 100
> +    update-alternatives --set bindgen /usr/bin/bindgen-0.65
> +
> +``RUST_LIB_SRC`` debe configurarse cuando se usan los paquetes con versión, p. ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +Además, ``bindgen-0.65`` está disponible en versiones más nuevas (24.04 LTS y
> +24.10), pero puede no estar disponible en las más antiguas (20.04 LTS y 22.04 LTS),
> +por lo que es posible que sea necesario compilar ``bindgen`` manualmente
> +(consulte más abajo).
> +
> +
> +Requisitos: Compilación
> +-----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para la compilación.
> +
> +Para comprobar fácilmente si se cumplen los requisitos, se puede utilizar el
> +siguiente objetivo (target)::
> +
> +    make LLVM=1 rustavailable
> +
> +Esto activa la misma lógica utilizada por Kconfig para determinar si debe
> +habilitarse ``RUST_IS_AVAILABLE``; pero también explica por qué no en caso
> +de que así sea.
> +
> +
> +rustc
> +*****
> +
> +Se requiere una versión reciente del compilador de Rust.
> +
> +Si se está utilizando ``rustup``, entre en el directorio de compilación del
> +kernel (o use el argumento ``--path=<build-dir>`` para el subcomando ``set``)
> +y ejecute, por ejemplo::
> +
> +    rustup override set stable
> +
> +Esto configurará su directorio de trabajo para usar la versión dada de
> +``rustc`` sin afectar a su conjunto de herramientas predeterminado.
> +
> +Tenga en cuenta que la anulación (override) se aplica al directorio de trabajo
> +actual (y sus subdirectorios).
> +
> +Si no está utilizando ``rustup``, obtenga un instalador independiente de:
> +
> +    https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
> +
> +
> +Código fuente de la biblioteca estándar de Rust
> +***********************************************
> +
> +Se requiere el código fuente de la biblioteca estándar de Rust porque el sistema
> +de compilación compilará de forma cruzada ``core``.
> +
> +Si se está utilizando ``rustup``, ejecute::
> +
> +    rustup component add rust-src
> +
> +Los componentes se instalan por conjunto de herramientas, por lo que actualizar
> +la versión del compilador de Rust más adelante requiere volver a añadir el
> +componente.
> +
> +De lo contrario, si se utiliza un instalador independiente, el árbol de fuentes
> +de Rust puede descargarse en la carpeta de instalación del conjunto de
> +herramientas::
> +
> +    curl -L "https://static.rust-lang.org/dist/rust-src-$(rustc --version | cut -d' ' -f2).tar.gz" |
> +        tar -xzf - -C "$(rustc --print sysroot)/lib" \
> +        "rust-src-$(rustc --version | cut -d' ' -f2)/rust-src/lib/" \
> +        --strip-components=3
> +
> +En este caso, actualizar la versión del compilador de Rust más adelante requiere
> +actualizar manualmente el árbol de fuentes (esto se puede hacer eliminando
> +``$(rustc --print sysroot)/lib/rustlib/src/rust`` y volviendo a ejecutar el
> +comando anterior).
> +
> +
> +libclang
> +********
> +
> +``libclang`` (parte de LLVM) es utilizado por ``bindgen`` para entender el
> +código C en el kernel, lo que significa que LLVM debe estar instalado; al igual
> +que cuando el kernel se compila con ``LLVM=1``.
> +
> +Es probable que las distribuciones de Linux tengan una adecuada disponible, por
> +lo que es mejor comprobarlo primero.
> +
> +También hay algunos binarios para varios sistemas y arquitecturas subidos a:
> +
> +    https://releases.llvm.org/download.html
> +
> +De lo contrario, compilar LLVM lleva bastante tiempo, pero no es un proceso
> +complejo:
> +
> +    https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
> +
> +Consulte Documentation/kbuild/llvm.rst para obtener más información y otras
> +formas de obtener versiones precompiladas y paquetes de distribuciones.
> +
> +
> +bindgen
> +*******
> +
> +Los vínculos (bindings) con la parte de C del kernel se generan en tiempo de
> +compilación utilizando la herramienta ``bindgen``.
> +
> +Instálela, por ejemplo, mediante (tenga en cuenta que esto descargará y
> +compilará la herramienta desde el código fuente)::
> +
> +    cargo install --locked bindgen-cli
> +
> +``bindgen`` utiliza la caja (crate) ``clang-sys`` para encontrar un
> +``libclang`` adecuado (que puede estar vinculado estáticamente, dinámicamente
> +o cargado en tiempo de ejecución). Por defecto, el comando ``cargo`` anterior
> +producirá un binario ``bindgen`` que cargará ``libclang`` en tiempo de
> +ejecución. Si no se encuentra (o si se debe usar un ``libclang`` diferente al
> +encontrado), el proceso se puede ajustar, p. ej. utilizando la variable de entorno
> +``LIBCLANG_PATH``. Para más detalles, consulte la documentación de
> +``clang-sys`` en:
> +
> +    https://github.com/KyleMayes/clang-sys#linking
> +
> +    https://github.com/KyleMayes/clang-sys#environment-variables
> +
> +
> +Requisitos: Desarrollo
> +----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para el
> +desarrollo. Es decir, no son necesarias cuando solo se compila el kernel.
> +
> +
> +rustfmt
> +*******
> +
> +La herramienta ``rustfmt`` se utiliza para formatear automáticamente todo el
> +código Rust del kernel, incluyendo los vínculos de C generados (para más
> +detalles, consulte coding-guidelines.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add rustfmt
> +
> +Los instaladores independientes también vienen con ``rustfmt``.
> +
> +
> +clippy
> +******
> +
> +``clippy`` es un linter de Rust. Ejecutarlo proporciona advertencias
> +adicionales para el código Rust. Se puede ejecutar pasando ``CLIPPY=1`` a
> +``make`` (para más detalles, consulte general-information.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add clippy
> +
> +Los instaladores independientes también vienen con ``clippy``.
> +
> +
> +rustdoc
> +*******
> +
> +``rustdoc`` es la herramienta de documentación para Rust. Genera una atractiva
> +documentación en HTML para el código Rust (para más detalles, consulte
> +general-information.rst).
> +
> +``rustdoc`` también se utiliza para probar los ejemplos proporcionados en el
> +código Rust documentado (llamados doctests o pruebas de documentación). El
> +objetivo de Make ``rusttest`` utiliza esta función.
> +
> +Si se utiliza ``rustup``, todos los perfiles ya instalan la herramienta, por
> +lo que no es necesario hacer nada.
> +
> +Los instaladores independientes también vienen con ``rustdoc``.
> +
> +
> +rust-analyzer
> +*************
> +
> +El servidor de lenguaje `rust-analyzer <https://rust-analyzer.github.io/>`_
> +puede utilizarse con muchos editores para habilitar el resaltado de sintaxis,
> +el completado, el salto a la definición y otras funciones.
> +
> +``rust-analyzer`` necesita un archivo de configuración, ``rust-project.json``,
> +que puede generarse mediante el objetivo de Make ``rust-analyzer``::
> +
> +    make LLVM=1 rust-analyzer
> +
> +
> +Configuración
> +-------------
> +
> +El ``Rust support`` (``CONFIG_RUST``) debe habilitarse en el menú
> +``General setup``. La opción solo se muestra si se encuentra un conjunto de
> +herramientas de Rust adecuado (véase arriba), siempre que se cumplan los demás
> +requisitos. A su vez, esto hará visibles el resto de las opciones que
> +dependen de Rust.
> +
> +A continuación, vaya a::
> +
> +    Kernel hacking
> +        -> Sample kernel code
> +            -> Rust samples
> +
> +Y habilite algunos módulos de ejemplo, ya sea como integrados (built-in) o
> +como cargables.
> +
> +
> +Compilación
> +-----------
> +
> +Compilar un kernel con un conjunto de herramientas LLVM completo es la
> +configuración mejor soportada en este momento. Es decir::
> +
> +    make LLVM=1
> +
> +El uso de GCC también funciona para algunas configuraciones, pero es muy
> +experimental en este momento.
> +
> +
> +Hacking
> +-------
> +
> +Para profundizar más, eche un vistazo al código fuente de los ejemplos en
> +``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
> +``Rust hacking`` bajo ``Kernel hacking``.
> +
> +Si se utiliza GDB/Binutils y los símbolos de Rust no se decodifican (demangle)
> +correctamente, la razón es que el conjunto de herramientas aún no soporta el
> +nuevo esquema de decoración de nombres (mangling) v0 de Rust. Hay algunas
> +soluciones:
> +
> +- Instalar una versión más reciente (GDB >= 10.2, Binutils >= 2.36).
> +
> +- Algunas versiones de GDB (p. ej. GDB 10.1 estándar) pueden utilizar los nombres
> +  pre-decodificados incrustados en la información de depuración(``CONFIG_DEBUG_INFO``).
> \ No newline at end of file
