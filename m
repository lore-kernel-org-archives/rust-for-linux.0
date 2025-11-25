Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AB30E857
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073894; cv=none; b=meTwN6MAE1sDRK7aVqVTzrSm11jwSoAEY/VL40kbbfv1FfDz14Ww84w5/2bbs5Q8TR+5pe/cGfNaPYJqY0KsBGRErNyKsNrSWCT5KUlGIWRHN00dFlQEZs6sO6w8h5wARPXAJA7rGwNGfDQu4z92Rc+rKpb9JTuaw12PMEowE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073894; c=relaxed/simple;
	bh=ZoWbCU/Fz1+eyrddUOSOAHDIsvDgxcG/td4vjeOMl2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juM+0wcLCGv/Oodhi3bAUEXbltCleORxF/NT2HetbIymCTRCZvaGI0cXBDone/DYRwADJGXMKg93C6SnKCGUQKArl1psbjwUNnMRUL7dGPaSokcJHo+nSA6HLEvlrF/v724IDKPFNrbcErpeRBS3pWo6FORxb3DL5NSz0J8fCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2Zmu1Yh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2Zmu1Yh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2960771ec71so9537795ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 04:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764073891; x=1764678691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoWbCU/Fz1+eyrddUOSOAHDIsvDgxcG/td4vjeOMl2A=;
        b=Z2Zmu1YheNfqUUaODuws29/+BPn/BkdyS8uYlok75G0e3u0C+yTn/RURG9FEyzUodj
         eNcjwPq7qqNpvQWDdnil1+sDXY90lRTS81sWEoE6qA0jjAvEzdHSa7FNWRHZa1kcXr2d
         B6q5A8jRiuLVW0t5oR7rwOAWQ4ysgrzZsep2mCRbIrDgAPtbaEa6n4d2ARGu5S30Mvm1
         a5Wl85njIxmZi+dGQQ1gsLZW+Fw7ROe5CCLhsMY40LkYQ5BA3cALYyn6YlaG9xUuKs/w
         UiONKJhipTT3mjCdfuzCJoXFG4keKkmjj5kkZ680a/bU+3Oh5RqDTL9NMK22ySjW7F7W
         QHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764073891; x=1764678691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoWbCU/Fz1+eyrddUOSOAHDIsvDgxcG/td4vjeOMl2A=;
        b=V8opWkSz0hlnBBR1eg4zU3pm2wDkUnIxXUjSYNZbdiQdyEUXDxX4P5XETY8+kes5W2
         DkageE+4xljZPN99OIWncjXQMeUnX1AKaU0KjvZ+Z5gcJzIow06dgy0yps69oQ0rOaTB
         mhGd1qBba0OLWxuwXdYshO12fY67OXOO2xLkv9hgEpqNBfdqmj2nLtGMkETKw/A+bCAg
         2gxeMm9TbS/X+p7IniXr9pdkEM7D001FZ0XIUtBNyn4DF1rGpMo4//rLCWcng5qio/cJ
         CGwsDb9dETRX1cxMOO33KWh8jZ74BMo1QjZoP6WOnjBUMdEJqGiCIKfon/bFsiLpLtrC
         pnlw==
X-Forwarded-Encrypted: i=1; AJvYcCWSCle9FRs/9nXuttCSNTROn8J95+Lcd14PX5N/sXNrEuqfwcfAJ+VL1aBYBAnYMA+c03KKfy3dbjJM3ruSpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgwAvzycBQQ+fHuANBoq7ykLYayxqFglqyI16P9P4Knm70cI3
	hT5wOF7eSXB2MVGY3YBSoVQLtLAajjjlvxj8+UvsN2q6k0/C9n295zDXeKxJ2wEwm0unO+h1HqE
	jx2O1AzV6HWHUqDGSv9zJG2trifNkX8M=
X-Gm-Gg: ASbGnctTtaB5gn6w6iD+uXzTxuaKYsl9iwqOmeefCRTCM8H5CDyN0QwCNsT/LXL4V6I
	2t2CV/W+ETJVnkH2MVNdbtttt967Eenz/N3FVm8JUX5rBEQlyy24ISuuCkZ9+EWe+zXeu6ANwmg
	bz+TmUFp7VVWNHwbTkiKGmOeRjfB6yp4aAnAnjtwebZfPFNB6DzMoyNg+CchnYdFVm9Pxj8Mx+w
	khpuG5+DvPNXSBhcL27lm1lgg7fQBwGTjyMYN/2R3uifo3cgetvcQEwmLJr3WDO49ADllXYicgN
	l098+9xrvbb9rUtMuDd1zDY14GbRsq4NHetTNJUgJ3PaCXAZ7cbReK3o00YmI4kfhm/Bmbtg40t
	XuxZVhOAd8eQGaA==
X-Google-Smtp-Source: AGHT+IGgw5LUw+voSfpyRnybKCW9uSxmytNtm8JMKkx1AQxluRQJPOoxkh2lwkkXY6q2xRvx9r7q82tUTs2y48xKT6U=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr9704335eec.3.1764073890450; Tue, 25 Nov 2025
 04:31:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com> <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
In-Reply-To: <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Nov 2025 13:31:17 +0100
X-Gm-Features: AWmQ_bnzR1pFS2tnO0i1TQxesvIl8Xiz1UJW9FJjv7yVIIdoY1qGA_4D1PTisOA
Message-ID: <CANiq72mQ4cu9wehGKxS92EK2H3kcX8XPpRmv2DdYmn6Ve9iDAw@mail.gmail.com>
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 5:10=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> having no clue about Rust:
>
> Can this patch be applied independent of the others via the pwm tree? If
> I understand correctly it's only patch #10 that depends on the previous
> patches, right?
>
> Is there already a merge plan for this series?

Yeah, if subsystems pick the independent patches at their own pace,
then that is great, so please do!

Then, after 1 or 2 cycles, we can do the flag day change on the Rust
tree (with any last changes needed Ack'd, but ideally there will be
none remaining).

It is what did in similar cases for renaming (or moving across the
path hierarchy) things in Rust. For simple things that get Ack'd quick
enough by everyone, sometimes we may be able to take everything in the
Rust tree.

Thanks!

Cheers,
Miguel
