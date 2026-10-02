Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE14A43F1
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947050; cv=pass; b=uAS1jIJFM1Hxf0CytbcPeXZ+tmRMGG/r+/m/Y8s63PTL28cq4Byh8vH9kZ5sOy6tDpPcV3trNYZHJSkcxJwOhwY91FtZc22TTcIT7Yt5QK4lYLpjd2iN+zJP/ITBjafNoosZ4q7Ifsg7wpoGSX54R3hzwxTkEC5fYVrq+xH+sww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947050; c=relaxed/simple;
	bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJsZXsfEn/HcGw614nyjSaeGbH4V6q9MysfMNru0LxM/sCga7g04N01OD/7wVSHxVET7tlXoUNnNYJDppwD/x1YqdCcWSQtBtd8BDzN8paYe6G7FH0KydQedXtOqfozreysmkS1eGu2/p0eAtPpf0/jKt9mJJkWHqyIJrmcqY0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crLCc7fj; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crLCc7fj"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so347776eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 06:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947048; cv=none;
        d=google.com; s=arc-20260327;
        b=YF3thG4Tqze2t/1NmyYf9AdNrshx4iSHlBpG6Ii9ql2L3OK6RfyGjjxX21JEa/Xrbk
         UuyzvJRdXmNhmcv45PgXVttcYYxWn3RrD43c7gCY6ARWSXCKulgZq3GorqJi9QNjqX+k
         Oi8nWd325GvjLpQvxzvJM/mMVguL9HulLAWUUEGvl/Q+U5EWK8VRpbj1XynXaxjbn/Be
         jf527AwGVV06FqGqWFEL3VbLdmtT5+ZAI0vilrn5eaWhB58Y14AacY6VtxikqhWcbc26
         AURgrr3WG4d6kmfCu9zWja3UJVqHiQMHA4rk7MpYfNuVvKhsYWOwbDNPOLKSs0fkJi+d
         zSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        fh=nYVE6h20AM6cOVgkGL3FcNFXlOKe3/cIp1ZC+Qt6k2I=;
        b=TGn4k+ThKFlb+OiHYvykuZzPVv3PCk9MBt7z1YE50ZUlgs8Maz6SD6R328aBg7NtvQ
         L4uu3aT7jNEQYKWLrWXxAls8YBx7+CxcrtMfEB0QCnVKt5Io7NG6/5B8XxX3UfKx+BvL
         bnbETnG5w4Z7r6s/iDS0RCtNhLWp92nNHqJ5i/Xwllm1nOxXUaKXCPRZxTpwMNCp9mR4
         sWZjWujkqmOHOTFKU6YJACcuyMhqTj5OrEmusOk3uUCUU8VV5pDTath3cG0HIvXJ8YbN
         1ueZOBBxKwJlDjNpijL8mRroOu+WMbjzCUFEiUEjKKKSGAl/EnDaF4nxjjw5eXZY46/q
         aLBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947048; x=1791551848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        b=crLCc7fj4u2h3uzVdGMqhoxA62rSXWVE18z0NLuCDwkeCluUImdQuR2CBGP2+x/C+E
         fVZ43sD7IbEj0N5UrFGo7zukSYmMMSuOlB+70seiC7cM02+66x51Ulk3HgNIfRJgxbSI
         f8B/rF9epNI9JyDnTZAA0IadXaNnEWKoxgnFUb/Zsb0IemCG4aNSgfSLZijEE4LDMrgg
         rEjJbD+4f2T6Yr7pOei9sLze5XdJe5BZk6PLuM4sT7MxwqWJHhlPunw57vAvXrV7fwM/
         ABTHnk2gTzAF6pCNoGswH3bNj1pTbBKaWQwZRwpQAvo56v+0Tn+x3dWwMQmrkKhPovLf
         38Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947048; x=1791551848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly8KxKeFw5pQ2qBblCALtmS3tbfU47G97J+DOSI7Npo=;
        b=VjY0iTqtLJ/HgJWarLvUrNt4B4NVGYOYoCYVK7aCyu5hoaYtDJBO3Y53akA9qupT76
         EFjCdZQIGFagwRf2ymNbYSolFyuhE0/O7qMTafdm/2ltgfGseumhnAORLQYpeo+5tnYO
         /kgZiwN+HaCRlNRIkpxt+XQV8rue8FR0/fyjaAYFq8qm5B1IVvAMepy6uFQzLCqU8sx1
         Ww7og6FLk2mqysuLgsWV/+QTKzL+nykghpT/rvF2db6HDDr03y2xF5RJHXgyuoQecJd7
         s629oqSSwWJJTSsZVHXq4TE4fe4Oex9/8uolKEzeo17Qup09BkStP6p3ikIzuB9YNuZ9
         GHqg==
X-Forwarded-Encrypted: i=1; AKwUvBzbzZfgmZr6g1v0LIIsIweogWGjfI+exHv9a2XsfgQO4WxYKXz5cbQr97oWBX0cSfJY9DuuZdvyv585oUghDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIKm1XZG0C/1JWNMM/76FCVnRaCj3rK2hYip5NgYtN6uAFI1OLv
	7mUidfD8zx6iVMQf+eZ7A75WCMmj9ZaL4u57nye+JRAdbwpnAaMewPoZo48Jqw+kBLDI8FfmU6K
	5DzTgrMU6Mq8dlM2EpnPzrrXf3N7/FM8P5sPw
X-Gm-Gg: AYBFou2/QPlnpgL0mde6ZeultB5wW+pOoyd+EU/oSEI605vpcKy2B5OOOE7T1oS253w
	9jCU+rdcB0uJ7IzGJpsRSuKzyKCuEn+E7x7TTr5/4NlmEhJxcSuFEaNXOuz0iazL0HIJKmuuKYx
	+S8pqFAdlJ61bn116Wc2Sj5lLHsHxUwaBss2KGp4LgDdw58745w4rjhhWj/9lmTLEmEqqf3V3Wq
	pXntAACKqFYjySeMX+hi90tnBOJT2i7fYoWZTRxxGKDqnRVMf1NfEhbQqQns4k8BE8ZYf8xAW6A
	jzzChycGvkXTzv8bT/4mJkqJ+I2cVBOBVDjC70Uyw3UqlG0OhQKITRQIFpxWEGKa3iydF1hg+tj
	g6exyekV8Uju7G1RkjLmZ0c+r9aeCY58Me910N8xlu99qrQbknoPnYCbMK+ai02Rnmsa702Bp+V
	2YFbhyaWit5bQkj5UzlHpatonOUD5RM4sttW6Cl/bMRYIF2+ZTuOhn
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr4975765eec.1.1790947048361; Fri, 02 Oct 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net> <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 15:17:13 +0200
X-Gm-Features: AclHuK8j6jm4ckb1WgLL30lgTNmnSFAELi2oBsp8XXTTjt9_K2EqHepcmdMe70Q
Message-ID: <CANiq72nU8LgH7jYtFRQGdwvNvbdmLNxcP0-5PgMWFUvQ26KRCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: misc: use `#[optional]` attribute of
 `#[vtable]` macro
To: Gary Guo <gary@garyguo.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:56=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Replace the `build_error!(VTABLE_DEFAULT_ERROR)` boilerplate with the
> `#[optional]` attribute.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Arnd, Greg: may I get a quick Acked-by on this patch?

It is a change that simplifies boilerplate -- no "real" change for
you; miscdevice is just the example for the series.

Thanks!

Cheers,
Miguel
