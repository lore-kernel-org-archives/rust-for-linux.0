Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F52236F0
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994687; cv=none; b=mkb+0lDsJwHXx77R2rHc62lX5c5qVYmNEtI7pOoAzDR1jwKv6ZZq9U+oA1K2w69Z4fvTj5UQY/am3BAadQCb3PFY3U7UpGenSzaufKkItOfKmy0trAakIDAP192fi/S8xmNpfw4u2PYCDI3foBoFxCphU+lJgrSOAr2Evmc0HiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994687; c=relaxed/simple;
	bh=RXn5/RQyN57hHBNRboHJAha4cxgA0urfTS27SZmFcRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Txh/hN1ajl+ZHj/2xny7q3lNaQ6qvKh6/W9IceZIq7WdBjMoXgaANWX4n3fTJMa2O2SYcj+YxCi5Oe93OP8fygJHIt4v3zw3UjGvzWupt9mvcJpGYmZLP65xgtWH4QTxPRWsmb/GMBwGYwIDknEiE3dTwEyL2VpEz/859PmnYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3YE11Zd; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3YE11Zd"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be27fa54feso7907361eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772994685; x=1773599485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5t1AI6uKXfTggdHZqBXQPVDouEZyCrKF4p7zOoJm6s=;
        b=W3YE11ZdEYmta3lyvqBCMxrWet8YKdawv7RiDrccjKaPMI6jL8mSkj+6Wy2YMitsqr
         xhS69UojzJmkhndAJZzWc+RWBCHicrP8O3Uwp/KRlEVA80c79FbyY/2D+/pSmpgTOQ9s
         mUOkzePZy9EAWthc1RhuwtvqEUP9VDu5gj0CXKXiS0oZDUJXxU47dCs+GDKd6JpNxWUd
         tEENSK1H1/8c0ch4YxOhs2Ms4jOP1xqSAQ0rogzrJ4iZaw6NZFczpZ96QC/UkQCZ9SJ6
         NWvhqju8dLzcRZYqrsgIBPKVR/ZPZFc3MXgja+j0ZoO9LQ08CETRlL+OEbSU9tZFIjmy
         TV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994685; x=1773599485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5t1AI6uKXfTggdHZqBXQPVDouEZyCrKF4p7zOoJm6s=;
        b=Ygxb+YUYj7u6JHOzGUh9DJOuI06/NjFwhkyjtLNtsbubF/aFaSyBXxQc9lGfjJedjR
         Lm1CW99ly0idQpLkcpxYKCTa9MDiPtgVQZu9Ed9rJf8tS5IlAxAOQnjzYuaY2lg12h+I
         oozFIDfOTeWC46/P1gaJrHX3SpuPSpecgaVuhRqO/s39/0fTXZk1h4tAxQqubUZE0lQO
         bV5B0mkawWALQxdUuEsLZrSEnNHGUfcFHPEKn6gB3DyJp50mf51e5WAPU1NR9jqFmMgY
         QUZM6KAqYWkKZwEYSOR477NqUPyzUNdeOV6PnyMX7PS28TQd0KkZ4oDKe8ZjaiwLHS95
         zL6A==
X-Forwarded-Encrypted: i=1; AJvYcCUss5azT+OM188lpeTbcA5EUv7sId8WlE0o4Ctnuqq6leyeFB0EjmzoRTL4jxN8+3Io+2mqRDdpuKKZyLj5hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVum1UPvgSfTEsUtBdqW3YjU3FBgtNDy4FjDq/i3LPy/2X42RM
	e7z/3YwPUIKLUSx00BsohFL9tsn1BHkeKB8I12zBduloHdQRSJkzpeQ+
X-Gm-Gg: ATEYQzw2/8nI7JL2dSRlNbNfUOPP4QixQrdzkrQDIoTgivrhBwl6Mlhely3ETurN/GO
	Iz3afoFRjdsF3jZ1a3OCTHVAAt8urKW4zL1eMd6iP9ex0CNn81masln9uVAhGG5WoZliB/CkrEB
	+7PaVFD+DraUZYqW0AdYqYNNykjxzFR4oRFipQSHfcZKVv5NpPpb2xrx3Yl6lLWw+oyxwlZMxUn
	K6ffTuqsoqKTmg5SgOp9VyGP0Wl69gEJefmi4WzGeeSOneDD+RaLs6oxEq/71vmXfwtFyd+Abvd
	ffPfNfRvvLAa/ZRXBQXUPK8Zhqb/JR3E9c818WlhpXon92h6cLc2yu4S7/XuPa6Wy4TnfqDikWh
	hpr9Z1zdBvFMbpJYcSZnZst5HqUYINMkPiBLFtlLOXLpoLiQJKhClSArIbRoGgMzF4/19R3oHD3
	kn6+AwbhpBSSuC/PZUswE2LdSu63vY6Fsbap6nA7BM
X-Received: by 2002:a05:7301:1010:b0:2be:1f58:32a6 with SMTP id 5a478bee46e88-2be4e08fbeamr3065968eec.33.1772994685162;
        Sun, 08 Mar 2026 11:31:25 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm6828820eec.33.2026.03.08.11.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:31:24 -0700 (PDT)
Message-ID: <5581533d-5a8d-464e-b347-33024060bf71@gmail.com>
Date: Sun, 8 Mar 2026 11:31:24 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs: sp_SP: Add Spanish translation for Rust
 general information
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-3-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-3-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 12:07, Edwin Toribio wrote:

> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>


  Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   .../sp_SP/rust/general-information.rst        | 178 ++++++++++++++++++
>   1 file changed, 178 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/general-information.rst b/Documentation/translations/sp_SP/rust/general-information.rst
> new file mode 100644
> index 000000000..5b7b0225d
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/rust/general-information.rst
> @@ -0,0 +1,178 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: Documentation/rust/general-information.rst
> +:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
> +
> +.. _sp_rust_general_information:
> +
> +Información general
> +===================
> +
> +Este documento contiene información útil que conviene conocer cuando se trabaja
> +con el soporte de Rust en el kernel.
> +
> +
> +``no_std``
> +----------
> +
> +El soporte de Rust en el kernel solo puede vincularse a `core <https://doc.rust-lang.org/core/>`_,
> +pero no a `std <https://doc.rust-lang.org/std/>`_. Las cajas (crates) destinadas
> +al uso en el kernel deben optar por este comportamiento utilizando el atributo
> +``#![no_std]``.
> +
> +
> +.. _sp_rust_code_documentation:
> +
> +Documentación del código
> +------------------------
> +
> +El código Rust del kernel se documenta mediante ``rustdoc``, su generador de
> +documentación integrado.
> +
> +Los documentos HTML generados incluyen búsqueda integrada, elementos enlazados
> +(p. ej. tipos, funciones, constantes), código fuente, etc. Pueden leerse en:
> +
> +    https://rust.docs.kernel.org
> +
> +Para linux-next, consulte:
> +
> +    https://rust.docs.kernel.org/next/
> +
> +También existen etiquetas para cada lanzamiento principal, p. ej.:
> +
> +    https://rust.docs.kernel.org/6.10/
> +
> +La documentación también puede generarse y leerse fácilmente de forma local.
> +Esto es bastante rápido (del mismo orden que compilar el código en sí) y no se
> +necesitan herramientas ni entornos especiales. Esto tiene la ventaja añadida de
> +que estará adaptada a la configuración particular del kernel utilizada. Para
> +generarla, utilice el objetivo ``rustdoc`` con la misma invocación utilizada
> +para la compilación, p. ej.::
> +
> +    make LLVM=1 rustdoc
> +
> +Para leer la documentación localmente en su navegador web, ejecute por ejemplo::
> +
> +    xdg-open Documentation/output/rust/rustdoc/kernel/index.html
> +
> +Para aprender cómo escribir la documentación, consulte coding-guidelines.rst.
> +
> +
> +Lints adicionales
> +-----------------
> +
> +Aunque ``rustc`` es un compilador muy útil, existen algunos lints y análisis
> +adicionales disponibles a través de ``clippy``, un linter de Rust. Para
> +habilitarlo, pase ``CLIPPY=1`` a la misma invocación utilizada para la
> +compilación, p. ej.::
> +
> +    make LLVM=1 CLIPPY=1
> +
> +Tenga en cuenta que Clippy puede cambiar la generación de código, por lo que no
> +debe habilitarse mientras se compila un kernel de producción.
> +
> +
> +Abstracciones vs. vínculos (bindings)
> +-------------------------------------
> +
> +Las abstracciones son código Rust que envuelve la funcionalidad del kernel desde
> +el lado de C.
> +
> +Para poder utilizar funciones y tipos del lado de C, se crean vínculos
> +(bindings). Los vínculos son las declaraciones para Rust de esas funciones y
> +tipos del lado de C.
> +
> +Por ejemplo, se podría escribir una abstracción ``Mutex`` en Rust que envuelva
> +un ``struct mutex`` del lado de C y llame a sus funciones a través de los
> +vínculos.
> +
> +Las abstracciones no están disponibles para todas las API internas y conceptos
> +del kernel, pero se pretende que la cobertura se amplíe con el tiempo. Los
> +módulos hoja ("Leaf") (p. ej. controladores/drivers) no deben utilizar los vínculos de C
> +directamente. En su lugar, los subsistemas deben proporcionar abstracciones tan
> +seguras como sea posible según sea necesario.
> +
> +.. code-block::
> +
> +                                                    rust/bindings/
> +                                                   (rust/helpers/)
> +
> +                                                       include/ -----+ <-+
> +                                                                     |   |
> +      drivers/              rust/kernel/              +----------+ <-+   |
> +        fs/                                           | bindgen  |       |
> +       .../            +-------------------+          +----------+ --+   |
> +                       |    Abstracciones  |                         |   |
> +    +---------+        | +------+ +------+ |          +----------+   |   |
> +    | mi_foo  | -----> | | foo  | | bar  | | -------> | Vínculos | <-+   |
> +    | driver  | Segura | | sub- | | sub- | | Insegura |(Bindings)|       |
> +    +---------+        | |sist. | |sist. | |          |          |       |
> +         |             | +------+ +------+ |          |  caja    | <-----+
> +         |             |   caja del kernel |          | bindings |       |
> +         |             +-------------------+          +----------+       |
> +         |                                                               |
> +         +------------------# PROHIBIDO #--------------------------------+
> +
> +La idea principal es encapsular toda interacción directa con las API de C del
> +kernel en abstracciones cuidadosamente revisadas y documentadas. Entonces, los
> +usuarios de estas abstracciones no podrán introducir un comportamiento
> +indefinido (UB) siempre que:
> +
> +#. Las abstracciones sean correctas ("sound").
> +#. Cualquier bloque ``unsafe`` respete el contrato de seguridad necesario para
> +   llamar a las operaciones dentro del bloque. Del mismo modo, cualquier
> +   implementación ``unsafe impl`` respete el contrato de seguridad necesario
> +   para implementar el rasgo (trait).
> +
> +Vínculos (Bindings)
> +~~~~~~~~~~~~~~~~~~~
> +
> +Al incluir una cabecera C de ``include/`` en
> +``rust/bindings/bindings_helper.h``, la herramienta ``bindgen`` generará
> +automáticamente los vínculos para el subsistema incluido. Tras la compilación,
> +vea los archivos de salida ``*_generated.rs`` en el directorio
> +``rust/bindings/``.
> +
> +Para las partes de la cabecera C que ``bindgen`` no genera automáticamente, p. ej.
> +funciones ``inline`` de C o macros no triviales, es aceptable añadir una pequeña
> +función de envoltura (wrapper) en ``rust/helpers/`` para que esté disponible
> +también para el lado de Rust.
> +
> +Abstracciones
> +~~~~~~~~~~~~~
> +
> +Las abstracciones son la capa entre los vínculos y los usuarios dentro del
> +kernel. Se encuentran en ``rust/kernel/`` y su función es encapsular el acceso
> +inseguro (unsafe) a los vínculos en una API lo más segura posible que exponen a
> +sus usuarios. Los usuarios de las abstracciones incluyen elementos como
> +controladores o sistemas de archivos escritos en Rust.
> +
> +Además del aspecto de la seguridad, se supone que las abstracciones deben ser
> +"ergonómicas", en el sentido de que convierten las interfaces de C en código
> +Rust "idiomático". Ejemplos básicos son convertir la adquisición y liberación
> +de recursos de C en constructores y destructores de Rust, o los códigos de error
> +enteros de C en los tipos ``Result`` de Rust.
> +
> +
> +Compilación condicional
> +-----------------------
> +
> +El código Rust tiene acceso a la compilación condicional basada en la
> +configuración del kernel:
> +
> +.. code-block:: rust
> +
> +    #[cfg(CONFIG_X)]       // Habilitado              (`y` o `m`)
> +    #[cfg(CONFIG_X="y")]   // Habilitado como integrado (`y`)
> +    #[cfg(CONFIG_X="m")]   // Habilitado como módulo    (`m`)
> +    #[cfg(not(CONFIG_X))]  // Deshabilitado
> +
> +Para otros predicados que el ``cfg`` de Rust no soporta, p. ej. expresiones con
> +comparaciones numéricas, se puede definir un nuevo símbolo Kconfig:
> +
> +.. code-block:: kconfig
> +
> +    config RUSTC_VERSION_MIN_107900
> +        def_bool y if RUSTC_VERSION >= 107900
> \ No newline at end of file
