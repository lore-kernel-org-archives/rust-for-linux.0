Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492027;
	b=txmNof35sT35/EiZI4zMXh4UD0IW/N0tpPxGjJRNp1iYTSN/LSkXyGBOyyipchkRM2Wd
	 37fR7pZ4OaK7x8F2vr7uJmSG6zT9bFVgEroBm1lemq9UIxD6qTgoS2rSf/LgCJ/msvtPy
	 4BXQRVTn1mZaxOHPh6IPqGkd7Ltcod0zgWCgcYPo0PJ5LX5CZC6P1Pfa932izaUPpMkzL
	 TJlJ9PMAsXBGXppnpHvUWPNjny0ZQQeMtXmwdLXwbZhKQDry3umX+pRvz+KLJjrIjmX34
	 8yu5stFVXVwmQdBry3AubcgjPkPVgYxhOE2M13njb4etfoMI5WqEDKv2KLb2mGI/B+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=MGFz2hvuB/4DCXO3nS+z2wrzp61GKcDEp7t9HWfpmxb/6GkNxtSBnL/k4RhA9WkL2r6n
	 fK+c165ECP0DLATDFNOZKEt9HlAa0RnVV42BfXP4suXVK17FmdyL8SazlUAZm9uVl58Ky
	 Qk0a09+R5SmJHV3pVJUdsoNAO29WDAThjY30XO+Qyr9z7z2m/437BRrNGKXexzX70pnwQ
	 XxI0i1oSYY6HGEs4gFWJdiJM8ttrCtZj+cxzo4hGnEbT9y9uOWW+BSvsuO9U27mUtGA9c
	 OVNOzYP6rlEYV98Asjr9trlsmviof7ln8RM2C+xC1NocBBF9SETJGC+VzGs7wGted1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D5606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35e8253292cso203199eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=X8MGWXwsa0DH0cXzBHQbjzbJIbQQLb19mFwbdBy2n2lM+biQzU6nHbqnuXwHJ0LjsX
         4unwb1aw2bmoTvfKAu3m0biDxRTKO+DmAoC/F+3ODUAhkZwrTLo+zG+X4nq1l+2XJIo8
         BHJRpgmhquJ63PDH1t+uboZDhSjAtdGSeBVFSgvg5+IJwvSpyxccHLXl235aspE1ZPms
         vaVHbvKbTEs0mrgGllVv13jvxOojG/ywSfrIxKDilsJkD2qA7fzU/R2D2AJoqfvyoatw
         UYzR2mi/hS6Q2JHMVamj/CmMIsr28rdzQPRT9Aj7YAvDEd99J3PIxnghjP1cI0GC3C6o
         0BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=FF9VX7DrRYgeZ6dt0KxwydN/M/ZCbMqw0VgaN2KwDKo=;
        b=aG7Vr53XQQ5hbAuJJGXzcvwdckC/avid9qXcRT4Lx/sKnHksCtDCWDAB1D9Lh2w5pK
         rG490sedP9+BCDu3BOt0Qwl2c25gVRLr/CmO6QrjvcmXtnABXd2wIr2Xcql7MdHGoItq
         Yye+yKuqSyKvFFXorsyNQAMDip67mmdfrliJFqZBy/ErvQQSeCS3ytpEAx5tNMzbMiZq
         +XXtBNrluOcStp5cm62eOwoHbooVL0RHR5zQzKkicMCABSwAjEs2T8CLVOXdjyiK9+z+
         83vnLBWscWeiTpgBP9/72w62GDUHHlj4KEF3ICTj4O7HS0J8d0aFi81qJrJ3VTe8WiOj
         6tGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=eK+TzsrG8ppsuUBTMaNmtZbCwx1Zipxq05QH5xDzFvCB8pUTqpe+AMfkezQc9FE4q+
         47eMC81vpyd1Omv5sO+zDkakHWpHql5m6bNxnQrVrvxr67vRPTY6ommHrH46rl4pbAGe
         oX6tn5uuhJ0Pny2Z7AimovUIRmVppIjpaIUGRyBcLReYhmWvOUSr+tvqcrmE8j6JqQ5P
         zlspHWJBGuPxO2SoBJ4XJKzWF7VFR+Lxl+xi39nnPAMB8SGoovD6X8OZvLAh4PTir1zc
         7fQxEGw85RUrzwIka79bjhAwvI/G9PAfrDnYuaEL7jdUzxlwUMz0LmM6SSEsa902xGjR
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=AXgia6zPT4gC8KSlE13PklqULHTpBrvrXU9hU9Lz+jK0Ldxt4l7KDDtkzfWm5dt5wR
         WYuK3DlVdrDTD2OX3kv0CEEpl1HC9wAnmX871Pq/bIDiKyF/tpmAl4Nx0tc43kFGKmYg
         3D4xxThCV8M9sa2lzuIAIDiBMZUyYGhuicfU7PwKqddIgBvXSqdCfOkrDbu0dBu6O29o
         8Ex77fNxZwFYKl78kL9NGm+gDx71Ekw2wvT7JYo80DluC1U/bLzlRfBP73KOOA4bYOwM
         JrgUXo2SvBRsI2XB8xh4Qr9SKGe9hU9O+fnSvSo5QWGVcr7PK7QUWD3h2lcytlEnB329
         zqbg==
X-Forwarded-Encrypted: i=1; AKwUvBzRd2mysxBaEYYZ30feCWydrVNavimEjqYIkoSw2tDw2WVX8VPxEFnNXyKdP4ba+wj/qzdJNDmfNfcOdtSGkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5raQyS4X7wleC5G0F2489lI5cefRwmOP54H2C3r5D44ZixacR
	ITmKw9HKI+parHADN9ATsTL5v0tJNzv5XUMlFtvOM2aJWy4lLQl7CU8Rk2IKwJE5AhCAd0bynOi
	6/wvWfY4vZeNNBZ7L+vX6y7Yiu4rzW0A=
X-Gm-Gg: AYBFou2vmYU+bogeOOGUufhJPaZ6ZSlbM0xOaeutq6p7s6H+w1bGb/SGOjrhs/xTaTO
	PkWXgBykrh9PUkES2AlkMGp5DVCevgx6i6xsfwDFanqle+7e/zhda8b89OtcAlkGW0HLMYFwKJi
	tbfM/Jtccndlyy5oyfWShP1w+X19Y8Shnk0bo97Ina56Mv4muHK4W0d0uUDYqgdE0KtpWjSDm4X
	7paHLykiLK6ACzJrpUVd8jmslsW3Lrc8sK7aX/aUPyvTc2gjdWfIQsnhvODLDK9eYDzObipjbR6
	BFlCLSnqW9aMVFhGlwoUrcGV8bvFLarY0Gqd1NvHy5OOcazfx9EId/SEiJhw1wdEw9IJRDgwnoq
	ngKnUr1NAprRECc/tUy1VrHVrhmNSgjC2hUDVPoHj1gArIu4NVyJa+cBNRfjQFV6PDqTwiELlwz
	hAwKo3Pu07VfAxUQJne8BSaG0yD98vlhrwYHQZ37vnnYmYWZKTFcw=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel
