Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C329134C2
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Feb 2024 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707550641; cv=none; b=K4ogc908m+c9jfuN8CpmuQXXJcTyKhd46YjbKeVQ4MpHmhtBajKu7d/wzaHE7M60+IPKHvpt8e4CgXb16jZ0d7hHQkLd4SFujcEu3vY5rBzYc73aG8J7F49M3BLfmJLhmI1pYFMN7t77LefqPp2yMx0aGzmzsy38gIKsD90D/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707550641; c=relaxed/simple;
	bh=wLzT3kxybVRHtxjAAj4P0mmEp9/IOGMgE6K/G0P8ang=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZAIJOuEh96if6Cn85ht1BRQvp+e76BpUjLzRTqExBi5wtejQfeZDcFzu3o1d5K3fzVn9YT1BsRnJCny4A4ZH04BW8pWdi7HSmY3rj87ylHCtqwTBUsfjcTtOktIaKXJfZ+Q5GgNQ+cj91cbQV+CWlbZoEadWGVZT0J9rl2Gyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Ewqu4fWo; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Ewqu4fWo"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc742fc3b68so1949015276.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 23:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707550636; x=1708155436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb0z21y38PKEcQOwnGKKE2bJYdRFhORsMjpmP3nxTUA=;
        b=Ewqu4fWouy69ZO9y6lQYiQtC76pt3G4Z3EM4aZX3gxnceKBd7r4bcE0cUiqN3igBQw
         w7nctjPQhpTf554LbYU5b+yRkB8iiDmJfo1YTaHaxU66nE/eHt1JaHhRWhJz5vWMciwK
         DJF1Ub1GaFs6bZE58LoEzcFNcxyLi/+z7px63FqQmfOQWja5RlzWEYJrpSN6k5mb7V3g
         axxk7aaDA1k7NJwdUDo828MYgNo+EA67ndXx0ZPIp3J6l7rnXwcOIae4iJdjSRWsyuAJ
         ihbGAFDPaOSf82sTcQuhNmZHggqXwxw/4sp91glWv9Ylo9P/MB6oJJOVbrh6XAR7QhiF
         lYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707550636; x=1708155436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yb0z21y38PKEcQOwnGKKE2bJYdRFhORsMjpmP3nxTUA=;
        b=nAZZvMKqB2W35vRh66XPi5vLZGbsdCYYg9rbCgGePWo9TG7LwTrPvg9QVkUHkQzy54
         NLR3F51lcGBKP0KHQsaQCFBVqBTZuivE+TiLwjUgRMngfJdZsfw7eKrQQTL3RP/AabVv
         tQHyf+qmk0eEJB2H+DlUm7n8oVMAIG/ohiJVWHur5nDEusRgMLV1+cTDihBzxMIqD4rm
         YLcIzR1wgn+/RKaB+/n8BgaoTi2+vXBavshIttEK/zul/w0ac5bNc3OBa/hcyVedQz6/
         7k/1Em3f1LySG+IdEGkLrj2x2r4RVGQT+ImPCkElMDr/0s/1u9+pae8eYbfcgF4EVv8l
         Jt0g==
X-Gm-Message-State: AOJu0Yzl/JfExJl/suRjKQuSwFXcQiRTWOBOj1f0WfUEAczjmbFlyxWK
	dgY9SfOKLpEn79TDMwvGqwFTDwuziZI9xS0Ie+LLfyP8mTgkaUdDw03eIe8B0AjNkdSKsd4EuQO
	nDgP+334okMBSTLMm4Z+mUb50p9wl0R7GJbDVH1md3xGpm/hzlPaRZA==
X-Google-Smtp-Source: AGHT+IHc7rD+INETP7yNMsaRF+d1pgR9EwP07pdf88jNIBkWQS9Q8SqK+hIX/WIP/JEFHjUL+twhp9J6ww6ez0/JZGw=
X-Received: by 2002:a05:6902:2181:b0:dc7:4951:5f8 with SMTP id
 dl1-20020a056902218100b00dc7495105f8mr1698370ybb.22.1707550636250; Fri, 09
 Feb 2024 23:37:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209070548.3693410-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240209070548.3693410-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 10 Feb 2024 01:37:05 -0600
Message-ID: <CALNs47uhNG-2MRHx6Se-Qa0Orv+5L9qo2f8PDKm_d3cmiqm4zg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: extend abstraction and binding documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Valentin Obst <kernel@valentinobst.de>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 1:06=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Add some basics explained by Miguel in [1] to the documentation.
> And connect it with some hints where this is implemented in the
> kernel.
>
> [1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstr=
actions-and-drivers
>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> Changes in v2: Try to incorporate the v1 comments from Valentin and Migue=
l.
>
>  Documentation/rust/general-information.rst | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 081397827a7e..91a5a69c7c74 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -64,6 +64,54 @@ but it is intended that coverage is expanded as time g=
oes on. "Leaf" modules
>  (e.g. drivers) should not use the C bindings directly. Instead, subsyste=
ms
>  should provide as-safe-as-possible abstractions as needed.
>
> +.. code-block::
> +
> +                                                       rust/bindings/
> +                                                       (rust/helpers.c)
> +
> +                                                          include/ -----=
+ <-+
> +                                                                        =
|   |
> +         drivers/              rust/kernel/              +----------+ <-=
+   |
> +           fs/                                           | bindgen  |   =
    |
> +          .../            +-------------------+          +----------+ --=
+   |
> +                          |    Abstractions   |                         =
|   |
> +       +---------+        | +------+ +------+ |          +----------+   =
|   |
> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-=
+   |
> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |   =
    |
> +       +---------+        | |system| |system| |          | bindings | <-=
----+
> +            |             | +------+ +------+ |          |  crate   |   =
    |
> +            |             |   kernel crate    |          +----------+   =
    |
> +            |             +-------------------+                         =
    |
> +            |                                                           =
    |
> +            +------------------# FORBIDDEN #----------------------------=
----+

Awesome ascii flowchart :)

> +The main idea is to encapsulate all unsafe handling in carefully reviewe=
d

in -> into

> +and documented abstractions. These are then considered to be sound. With=
 this model
> +it is ensured that users of the abstractions ("my_foo driver") can't do =
anything
> +unsound if

"unsound if" -> "unsound if:"

> +
> +#. the abstractions are sound
> +#. they don't use ``unsafe()``

Technically there is no `unsafe()` at this time, only `unsafe { ... }`
:) (and `unsafe impl`)

> +Bindings
> +~~~~~~~~
> +
> +By including a C header from ``include/`` into ``rust/bindings/bindings_=
helper.h``
> +the ``bindgen`` tool will auto-generate the bindings for the included su=
bsystem.
> +See the ``*_generated.rs`` output files in the ``rust/bindings/`` direct=
ory.

Worth mentioning `rust/bindings/*_generated` is only available after buildi=
ng

> +For parts of the C header ``bindgen`` doesn't auto generate, e.g. C ``in=
line``

".. C header +that ``bindgen`` doesn't autogenerate"

> +functions or macros, there is the option to add a small wrapper function
> +to ``rust/helpers.c`` to make it available for the Rust side as well.

I would say "it is acceptable to add a small wrapper function". "there
is an option to ..." sounds a bit like there's a kconfig option to
enable.

> +Abstractions
> +~~~~~~~~~~~~
> +
> +Abstractions are the layer between the bindings and the in-kernel users.=
 For example
> +the drivers or file systems written in Rust. They are located in ``rust/=
kernel/``
> +and their role is to encapsulate the unsafe access to the bindings into =
a safe API
> +that they expose to their users.

I would move the "For example ... in Rust" to the end as something
like "Users of abstractions include things like drivers or file
systems written in Rust" to make it more clear what is in
`rust/kernel`.

This looks great, the diagram adds a lot to making the organization more cl=
ear.

Thanks,
Trevor
