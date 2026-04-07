Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0C85C4A
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524523; cv=pass; b=VByNrDuXxlHwgIbcThYecgfJWJgCu9xL4o5w22zDiOy7UQd/u0II8f6brCT1Kh2zUVD5hfmDTFsrTtyUWTHYi/SQzS3VnJt9pfoQr7prwvkTwy997nDN04UE2betx4944J64eLCYRKQOe5VtH6HvMKZ3Kz/CCIlg0GXRtABDmCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524523; c=relaxed/simple;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIWbqUok76OdEh3d+RUcfxqaYxIf731uwoqACI8khm0y0InehNvsSnHFDKPGYd5JPD0ZDUhSYaA/D0FWE3q3B66rUWI/Y4U6o3jKUbDspB0dhEbvRZsRUvgdNeC6cr5T+7mil0cV4IVymBoRvJL0jAk6o2mIV8k45vw8PiMy37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGQ703As; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGQ703As"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c6f5574d07so194899eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=CR40kZwXnzSkl0CHZn2H5o5A1+7CdNNloZ4tn91Z0h5TnGTvuC9ISHPp1UFVfp0xl6
         Rw5TFn6NndRGwokGh+cVw4yJPHVWaddqOJ4YI6drzzUzFxmGOxspFs/KxmVz5EovEZME
         odAsnkI24qRl4Cis+FuaRYE0o+jDtKq1Vnt5xxtedxSl6FxB4uP+qufxhzcAQ+pOiL30
         AHlEDt4HezFy5yaCZka5qGj//KncoWmEVPQlUcHNxfWaDqGH5X/xnxvNYsHf0l/e5EHC
         pLjIaff0r419jiteNN09mMt9NS0LL2L5VHEjiO1chDaxydB+TUkwSaZO4woUmgy7lWfQ
         mq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=OMAZKIXw5bCukdDoVpBX2stSA207q9MZ3lHlv3Czxkg=;
        b=iLNgjMN+1E6UZSBrvxnfMSoN+FCTu+OhmgK0d2SoSdRDX+Ku+drgZhTItWxDmXGZcM
         Jvb0V24jQ+4+87nX7a4Eb4z1IRa6CkAWRj+JzLvwjcDeMBLy89qz1WcqOQ90cIBqF3gX
         hSuuPEe6bzVwC4i+/kf8T5JU46IDjpkgjvmwwXD/NLIONDSyHFukJmjJjH6Oz7NqdALu
         JVX4iOFljYp64rj9UGHLJ8yF6Sgrrjef+JMc4g/z0nmfM+jRV5Dr0wcN2VrdB2A7LHv9
         3LVNy4F3G3Mvc0q/s4q1FI28d0Kn4pKJtupUGv9Mi5CQP0Rnunbk1F/oN6SZpnAVf8RK
         X51w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=YGQ703AsCty0gWvo5XnlPxhjc5LCMeOjJ+5VaBNrHpu+0TsSyjrNcWEWd/m0xKLvux
         Fz5M7QK2bIoG18YbdIV5pRHLUt0VRJlRNL3J2rM62DhKJfRPvZiTpFS5LoAtuErROO2A
         i5cq6rZGi0/DoY6biOvoAPYi8iZftts1ZmtoQjeEvt3xZ+dK0jCer/1bDx9ZChZ+Zp0s
         7rRkWYB/dNzrdFZyyERvo07rZGCl1n5PabJoeFVP4Vr7eDLp+plO3A1tRXMKwwL0NCB4
         seVG8RH8bxEcUVp89x1xzYmOL6jQnuRQvt7t2bQgN7B7U8eQ6d27Ci+Z9zrMJMknNpl6
         Tbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=ZbuHIFjiUg8ANatZLRBAcwGfL/glhkLk2db4dnFM/lIgcMF/+UMRPHDLQOyLmzbSvL
         A6lm74Nt6BIR2iQ1+lp7Ar6AHWiRHRIK7nVxtBT4GHPbCVQizUIJPmCxpNymxsotfAip
         1PpMNis8o3AddS4VPQUGhsKLCSjp5MUAZ77RVkEwnws199NP4DIqp+jfUweLe84nck0q
         b5fZQjyZkMH8bRIUUqvhKBikr1CjebUaPxo+gV5wNZHQhpxwZAnDR2RDmNsGCMQU6MZZ
         ZXf01oCwtm5hH77OpAQ9F+EhdC02CezOFOjblpinhbNGVvHpSpQOLgqqWWf1igF4JDHV
         4T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUexxGYLy9sn0sH90O5wTnV2UOz110lTdiUnj/ZMBVPgOJbTGFjJbBvTZtkzUOUZFx3JGj3Szl0VdQTQwEJ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44JmUyuROJDn/FSPf/WmLwO0j6YUJVpoXEhqPdrKfUsNdhnbe
	f6MaVM685Ne/V1Ryox4yDpWrrR03dQnhn3SH0FvJibdu8jnab+bTsC+9iGB/Lfe7im/mOoB5OLN
	Wck/LHxVDzoZ+5xRB8fL6i2QcuyD9xK8=
X-Gm-Gg: AeBDieu9MU+IGY5bRaJVaIms16L8gOcEnpHAXZg9+Or4Vq+hpMk9sL0tFmeDjNuT8Oa
	SEhKgF4tIQcZZqtlcWKZOOcNGfXZLluppEKMhlBEr6fDFdLliiWcnZ8CqJlqh7pejESvLTvJJ6e
	zii73+rY6XzAOdwrYKJ3m6cOkPIFiluJsVA44uDHlk/E3/4mh/gCvT/ZmONFDqMl39BnhQMhmlx
	Wyk4QgX+LNmrtrW5Do760wNFvbz5uufYj5xOBE3KIPuUh7RqY4I0Zexq5DYZoiwWSGj/N9UKXzS
	l1OBjnHxpOiModqjVK16EEWgyIiYN7l500S2NLKacJ55U5h7ABGG6hlQG9P3trQE/Pg4sYqHIzD
	Ei1Vlp88hAgm6baUWXTLKs/s=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel
