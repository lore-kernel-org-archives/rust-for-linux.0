Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCA17993
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434456; cv=pass; b=XqNi9nCEWdinFrKt9TStdM8w2yJ404jTbOpeL1ChnVULcHvA8Hor1QRBBnGroToVs4edfj23ULW2qYJ31emIpamclVmX1e4AbwEON2reLY3lrjACkumOCevVbeTgBiw7LojTq90azTyZwqkm2Bkdjxa3kHRf139DTQouSOYZ2qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434456; c=relaxed/simple;
	bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSR0UGt8A77EGOX4vzoKNGgI+/3eNQR+vRo63rmf89CwQZfrR+hXrhYGlaMIdrHPIhVq2k/R8/CL+9bkDR6mfzuieoZtw7xNRZMtUgarWodi40iU99vyuxt8hVYsLyIFj/9YJOqfS0v/GZ/7V+cTxHYPCH5E+Zx6+DSdviMJby4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2EL+ypO; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2EL+ypO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2cb19ddda43so255425eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 17:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=NO/h6LGs/+gYPZFZf/KRFnFbNAACj8w3pAbSkCtkMT9tfG5ILNyusaKX3YseetFaB4
         hkT7UOVAi5tG12BHNb/YP51RMKmgLIPAYl9jKSbY4E9o82KrFyPberlgDoifoVd+364k
         cfDkjID5Q360ogaOYL4E89O+X7XFohr3O63UnsW9xGGNruCD2QIWiNNMGvoWsyEu/8i1
         Hnj/UFtp5TC/86LsvltQ7RH+KB02aL/Q7rVbDb+384Uatz/nnR7BM7xtBI/aWwEElVUi
         +pPyseB7+DasMslM4uNinDtBlBCa9JNqGCtkjL5RLdo/mtIUbRVtVuiL2bwNbt/u9z4J
         OTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=sJf3OjP1SZP4hzNvSE6nXZkPNreS3K36NHsaLUhRbMg=;
        b=XonB2nBzbf4gCYoxcNzq9YeYiv4IyG/x204sh1Eetat/t9vQ24o7ZLBXtiwfDlJBow
         0Ksd1pAoe6iRftVDOzl+eo1zl3o2LKHRk2JdI2ZJGS9sAEcZvlPQ6njidkDhIVdr9OuI
         Jz9M0apDv/ocvswwyoTX8TRT6rcwEJetCzseAlVHbrNFty1AeQj1/ImVOGBvKeXzXen4
         1Gr4gy3+bESuIB5P3OuC5TOJezS/SnKQ/n+12bxavUjHOXv4hMAvrZxjhTc8XICEa1b0
         Hr+i9xG5Bmk+h0yA52J4Kswi1ZMD1SdInaSTsyVjnrUFTL1t6E81GX9HZoUAsUMeLpwI
         oipw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=W2EL+ypOcsaqQ4DoOhrFDh+b+1lAXR2+PfuzgePaD3QyLeW9tXTGFiV3lS1LJThAeX
         NaxY/oEFMFD0Y3i01XsEDpIhm8gOXMv0koKcxOIKicMgMti/P335kHExMP467YZP+Yn4
         Yy6jC3XqkJvOPhp1FwbNbESJ2OFvctUAgwlzHRAqS/JEy5mUEC2TIcLLwoRD8IU5BXHI
         EyvU+eQL2oMhpSEi0gKa3v2+Yk9nWVoOpuiLpMemSm6bu1MU8SModMlqUbijJ15Z0Jjq
         EcINdtOvxyfb50KcfPS/u3a17tCbzMlIBmnJAh2YlYTp2SQTFwIRZOigAmxIK6ERVnZn
         bqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=k1XyjJOGJXpSL9i/dHrkFOhxTfh59qZxjdYrSSZc7vLNSJELX1mtGhpswEiDT7rQ4G
         6CQuOQb6H7dhMGDiTht3/G2a10IUtX253MRMNQBgKxGa8DT/OcuK1rBF1bxmwZhY53zD
         CxvPPwztmYEsYRh7uSKMqUQ6AuH3OCLT59fI+Owz65YQAhYcwKgP6sk2pi9haascGwcY
         bEHPhOqC+0N55ZoCarAaisNpcKMOHb+ybZ48XBnQzxGX0wq5b0+mkKR1gcLHh1RkZxLw
         EQmsN+45RWNRmENxKrKGdGyaP+mpja2wu7TZHmBrdT9p7tNDdBaiqjcrOrWSfbeRdWsp
         sEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVacjeB0T9h05GY56gYwnC3qayBTx6Z1i1XDEM9ZMUd50L/hRZUFQmxWIBMQwrAUejrlkTdKNOimtI8Ou5D+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcHSU7zGNUntGKwXFFMkBvBR3433LOtiyx7wy9iz2zr5XpqnG
	okT03yWwKXFmGUZubzfwdvy4nnqQjEmrHhAgw/CMHCXkDUjRQekCrBKCLRssBSo3EvJmCSfQc+z
	O7pDWHvAopx+FzfAwTOk3F1h53C6dy7s=
X-Gm-Gg: AeBDieswoouqxzOcNC2DV15C1Z1PsfBoyoBS0HbroW+lkePPBv0o1oUDhfiZ8Auajel
	u8D9gTwM7wMHC2wyfB2xwOuz2QldNmGXnnuSJaM6HiA6ol4Bk7EY1KSOQQjrgN0PquSnGLhJ8nQ
	rAeL2AzCz6GBvUM41QSCSOVBPELYMkO4wFcBlqdNpi/STh5yMIxUar12kb3f263HmvT45zSU0EC
	qxXmT+ubU5Fi0hufaaW8xgL5LO/nsXDGpk3zGis1CItf5Ne6BVxVeKWATnw0+KByMEX/q8E9TUh
	5GVuPvwi4T3zQZj9SlcCzrJn/JvmDhyEKkE4AkNII4uoJ/rXXL/AZJlSlAeH1IazOSuP57/OUv+
	q+dDN9BhtlebrZuQeZ+19VwA=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel
