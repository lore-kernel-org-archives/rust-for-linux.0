Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C19B15666C
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363858; cv=none; b=IAM94lxqA+413F1OusK3Ee7briL7rL+rKrPe2KrxGi8lf7WWRC5zMDrGz6HDS4O+Sox2CDESBhqn4DnEcdQyVt4spKKEFtzetcZ4sAz+UwtBWoPRAoaiGxfxWt8bAEt96frcQeGx6rcX/qlIoLDMNSaMw6DgC6c45MgVGqc1kL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363858; c=relaxed/simple;
	bh=TfYVHYoD+0Zz8nVSnlljH4qLV4ccoBgjmuVjs+vfcck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLy7RtbQMljQAIfY50Xdkiz1g4YjvHn/IX52b57WDgJ80alPu77EjFX3rH4D8h97MeYa0/oa2+WWSvBhZ/uQqhcD10pW6767AquON2jVgK2gWuySvQ/5wjrXExQW7Hxr4nXu7kMxDGxSE/XLUwYZnrynFAAs7ZXkkbic1FjMIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zVF194pP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zVF194pP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d41894a32so364856f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730363854; x=1730968654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfYVHYoD+0Zz8nVSnlljH4qLV4ccoBgjmuVjs+vfcck=;
        b=zVF194pPPAfUvEWURJcmvYwmptQIyBJRO+i1ILrriGAAr78PkZIaKGX+ToWdZLGqeJ
         PMYK/FWJsJHuJpsMMeIDmEWh+sk3QyD6FJ13AM/OC+iIEkMzjDPf0QafvJHnUIu4JhHh
         HpJsqtDHKhNpfvK6a0cZTSImLNzKufeaSUrbNsuqF2ZequwPXi/kFXLU32p68IAKV2iJ
         ptG5dgG9K2SlNXt5JTybtVzsOC81ZFHWUN9g0308gnJGqpgR9uqm/xOldsPzZpqdhpqZ
         9v5iVaQGURfdXrzo+lu4GgLwMbuuX1I2f3qp6hk/P8ltI9qIlktbnGt8tG8cwxxwZm8G
         pYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730363854; x=1730968654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfYVHYoD+0Zz8nVSnlljH4qLV4ccoBgjmuVjs+vfcck=;
        b=szlV9fW64oyRuRoSCTMKqDmp686q3YBq9Vch8xaSyh2vPxBfnZxETXxduQNo48zMI7
         4QU8EPCLZ5dvZ6uchyHZ8l83TCdTtFfUkn3xmf1Z11zBfZmHHFMIL78Yduxw9Uk5ybk0
         ozTHSdd8t4XDxsqn7M4stBQvfo9Kwe+mO4FZrNHFjwFFjhG66bNEHMvwoTQoRBNcbYxM
         3kMgBeBUZ/6hai5594Us3g0NtcbD32x23ZT6hcp930XfEq76o05/P7gfiiJVMh5UqrbW
         RgRyD5+hdF517d/N04FQft8Z0fZIVOYJZf7KhVmcbIlyb/hk8OfsTu9SVjvqyqvnXpY3
         cSPg==
X-Forwarded-Encrypted: i=1; AJvYcCWoVVdLSHHM7tKd07s/WTAz1Vo00qISxC6z5PasK/vu/n7KuG/HkcV5sLBtP/fj4mbYVr0DFiWRrWboeP8n2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdTQhbVdKuIXynN9kkAit4t26iU5A4+budyZw1szahRQXuZD9
	5EQDcUNLBc/J5JBrgR0l6e8VQkuAxKVoDIuMsM0gMrN2cve1gnucS+zR+bgZiwWtDIzlQjSTeUY
	EoDa7b1gzfOZEvPWG1rOrcSE3H+A3kW7d0MQ6
X-Google-Smtp-Source: AGHT+IFkoCACno8J9Cj+eUE14YCUisaOXgkfyTdtha6bjRw0zep0Vdt6hu08BE87FX/3HSzt/APQfm8linyfYj32PnM=
X-Received: by 2002:a5d:64a1:0:b0:37d:2e74:2eea with SMTP id
 ffacd0b85a97d-381c1306a0dmr1180656f8f.5.1730363854418; Thu, 31 Oct 2024
 01:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-borrow-mut-v1-0-8f0ceaf78eaf@gmail.com> <20241030-borrow-mut-v1-1-8f0ceaf78eaf@gmail.com>
In-Reply-To: <20241030-borrow-mut-v1-1-8f0ceaf78eaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 31 Oct 2024 09:37:21 +0100
Message-ID: <CAH5fLggmdqF3SjEZn336O8g9Aqjw9MfCqrDoFVRTWiirkjXn1w@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: arc: use `NonNull::new_unchecked`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 9:46=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> There is no need to check (and panic on violations of) the safety
> requirements on `ForeignOwnable` functions. Avoiding the check is
> consistent with the implementation of `ForeignOwnable` for `Box`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
