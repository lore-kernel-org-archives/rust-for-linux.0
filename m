Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73521D3F4
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023265; cv=pass; b=KPZhQXcAP6vrVjdY2F3SF6zF9WwIaftfA2VuvOjCA+/ob8D9fV1GqAlHKcuOOah6svnSoDARHjSf5QagSFsnk+1/aUxwBTlh9+HPXhRKhwZ9iHl9J4UDahk1aPhnIwhw30bGsegcZ35cjAgoWEhgMVViL6yiwec2eEY5lpZOy5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023265; c=relaxed/simple;
	bh=lRhCryaHatFHPppU1xNTY1b3biOzFgcRi3XOIImuU7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h57uVhAhG4cvT9fO//yhORd15zIkIDELuSheWTs0a0QVd93i2Do/iwAECfcml2POA3hExKy2w7cFXqs0ousKszH26w8+X2ezBq/0cBrReuBPCzQBVv7ZwVRm81wE83jg0PUelpE7yt8BlOTFX3Bb7tlrzgxFfBRrgn/Xihhpkk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA/IM+TA; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA/IM+TA"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899ee491af3so80548996d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 19:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773023262; cv=none;
        d=google.com; s=arc-20240605;
        b=fn1yQJUFOSYLdh3TbZHGfOURuW2HJ5b91VoqHOuj4+WvioFILwKpo2JlQjdxeDbNHq
         BaA41WtsYljvLbulPbnbJWNYAzU8csX5Bjz2aS06GZvoGBd93wfxtaDHvW7Y62IIirTu
         D6yfA6tqce+i4sNIqywcl8narjvMJRLGfpo5ge+3ZhOdCOXzX6lFofgmncoCyP4fwNwA
         LLojyc1kICnzWL6ZZK2gI7jaC/9ri36VtDb+9IDwqD+9gxyU4bY6um/B0YS9KTSJO1SV
         qquC+x0F6qceBEZEJUYaWDR+Co56RHi+N58N7sYo4z1XC9u9qsKfRpmcLtvp8laYBo09
         bZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5RU6BCjytPyyzUpkOxs/fzBSSRBzHFkspiRq/z9n8w=;
        fh=RbbyVFfT39/M3CxCwODTIQnB4wwm41p1qnFapilkPs8=;
        b=WxMocd/xH0dtZ4G6IefgkEsisgaDioOHUr3trlW8lwArtcE8ZydRX6/eeH8m8GYYs4
         NZyT7zMtz/q6n6wXhFGMCGcS5fwE3cFBq/kALPJ1XcWnnWEFLAzmJitX3ziC/+P7P7jG
         JzFgINNcv/IEMn2+b+9QIPnL7a9hkjNy7s3mlkAQV4Vae+y4hUEfZNxLWHmnqrQYjOFX
         IXcPjjLaHNBDQm4+lCm285n7HjTd9tkFITqabsYI8fEek51jIXpKykVO/ZlpENW0NlDG
         ULce3Jg4ctuTF7/qOSQitOG0lz1D/vA0mvG688UG007SgqiMKkPBBK91B3br0BI4CdMp
         zVbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773023262; x=1773628062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5RU6BCjytPyyzUpkOxs/fzBSSRBzHFkspiRq/z9n8w=;
        b=kA/IM+TA0Zw61MJCYZbHa6xQkNj5s8fUBBzm/wHAkV+kbJlmPIU6VBLz0c3j5PFrfO
         UyS99Ij8oRlvrNyH62BCYImpMEq/5jfX7Fi6m17pCeHEWzICvmPHokppmshD1lEMZkgt
         cti6CTpfPbt7DndcnMX+bKIgvheOSjp3OtRTHoUKJzLyb2b72hMPA+yKZQiH5IhFRSCI
         lfpyL0sXbdEoaEG4TZvA/tvm/6zTh6viaqDvNNHlvM2NSWa8iUnLHgV3QtUCKwsdK9ZQ
         Ra5voDhGbMT0CCpowlxf2/s7mqOdQnR8F+m5CBNf5409cwd57skdM5z80yQg2+PYVtFA
         Btug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773023262; x=1773628062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5RU6BCjytPyyzUpkOxs/fzBSSRBzHFkspiRq/z9n8w=;
        b=slDXxHUXYsImLChAibVObaedTfLxX6maLW0lxpFJbx2dO21c+6OIyNMQEgn9oVscdi
         X3xLM1YY3VtWH627EXarWluAty/dTltej2ZRsBRb3npEbjTg8hgPUTtFRf6M6R3EchPG
         fKsBW1wKc3c9A6x/SDb9ZcL65EKbMrGQhIXKKxH6df27g0VwSFihURmlNRtHnc2SQNWA
         2m9o/CC0vrlE4KWMaWnBWyViZmIP/TjX+XWqgLytlGmblmTOqE23LTM6tJ1zG7QmYEl/
         tlmZRJGHlPDbl/+E4zjkNnq1zQQaKN+/GjBLgHcU6SJ8SoAqCYamcarR4mo9XZpvniwP
         0l7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOUO/svWTwDOsl1JElvXvPs7xGZ6UE1eY4TGDqA91s5k25TbsdF52BiLosmhzsWbknTzUeyCOrmWacSfYR3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZ+kBtV8mqQuw3uVBlh+eglLQcfiYctfVuKEkptlAN6hkRBR4
	WRA9xHF2X16sadKNcZQ2n9ufFn8EcHp9ki2G/s2/NsfPaKW4MJAhVh1XT8nJOuNDwPTppJ6bmXx
	qLVH5L5SzeZCyvitNjPqZi1sj8y7lV74=
X-Gm-Gg: ATEYQzwguASUSwDpXLwg7OfrdoS93IfmBsV+kPRublfEce/YFr+St2oghkWW/2H7K2D
	F/9W8FVW8cSq/zB2AhVgwxycAHsT2vJlpkD3Po+OxD3bhhAV72wtqVgJz6W4bGGoGs0SLLStOh+
	6Z+OILGUP+F7vwNLcoN5e1qnjdr72GfuDZMG/qhIEN6lfHdhjY21Wvm2PbwjY9W3szhdGrQiL3z
	Iipdr8m5s9caXJj8qQmHPCdkYvnxO4UXrIqimxFkGbLtwi85CQ3dLFkf867BGm2Wkgf6edqqJAX
	k+qsng==
X-Received: by 2002:a05:6214:d0a:b0:89a:14c5:f4e with SMTP id
 6a1803df08f44-89a30ae1147mr147853306d6.52.1773023262350; Sun, 08 Mar 2026
 19:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
 <20260226234736.428341-3-thepacketgeek@gmail.com> <20260306192759.GA1369418@google.com>
In-Reply-To: <20260306192759.GA1369418@google.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Sun, 8 Mar 2026 19:27:31 -0700
X-Gm-Features: AaiRm50InwIKSW37fYXL15ce4Rn0pYRvi00dG_w0G3xAUoq1wgM4o2jZUal9T38
Message-ID: <CADvopva0gqbPPW+DHOEumfCW4e0qn3ZS0=FGNAdpvjQR5iwzZQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: module_param: wire StringParam into the module! macro
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 11:28=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Thu, Feb 26, 2026 at 03:47:28PM -0800, Matthew Wood wrote:
> > +/// Set a string module parameter from a string.
> > +///
> > +/// Similar to [`set_param`] but for [`StringParam`].
> > +///
> > +/// # Safety
> > +///
> > +/// Same requirements as [`set_param`].
> > +unsafe extern "C" fn set_string_param(
> > +    val: *const c_char,
> > +    param: *const bindings::kernel_param,
> > +) -> c_int {
> > +    if val.is_null() {
> > +        crate::pr_warn!("Null pointer passed to `module_param::set_str=
ing_param`");
> > +        return EINVAL.to_errno();
> > +    }
> > +
> > +    crate::error::from_result(|| {
> > +        // SAFETY: val points to a valid C string from the kernel.
> > +        let cstr_param =3D unsafe { StringParam::from_ptr(val) };
> > +
> > +        // SAFETY: By function safety requirements, param.arg points t=
o our SetOnce<StringParam>.
> > +        let container =3D unsafe { &*((*param).__bindgen_anon_1.arg.ca=
st::<SetOnce<StringParam>>()) };
>
> I do realize this matches set_param, and there's a good chance I
> missed something when reading the macros, but doesn't arg actually
> point to ModuleParamAccess<T> here? Since the struct is not repr(C),
> isn't the compiler technically speaking allowed to reorder the
> fields, which means SetOnce<T> might not actually be at offset 0?
>

Hi Sami,

I appreciate the review! This does seem to be an oversight, I'll try
to figure out the
correct implementation. I agree, `repr(C)` is likely needed here.

> > +
> > +        container
> > +            .populate(cstr_param)
> > +            .then_some(0)
> > +            .ok_or(kernel::error::code::EEXIST)
>
> Does this mean the behavior for Rust modules differs from C modules if
> the user specifies multiple instances of the same parameter? I believe
> we just use the last value of the parameter instead of failing in C.
>
> Sami

Yes, I'll fix that, the implementations should match.

Regards,
Mat
