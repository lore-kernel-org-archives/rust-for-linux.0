Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE158AAF
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051725; cv=none; b=LMl4SDsUQily0ldb1dkpRrbdeqofkhL1qGFB2xwSEIYrtJljZDTRJrfCRo7S6dJJcSwx3ght99wNjqrKolz+8SL739mMmoFbw9sCcxoVZxu7HPZr4mHBgJ38vaJ+MmWQbLeR98tSR6WdZQBab1evzmItXoIUlIR/jUOoJYhlEdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051725; c=relaxed/simple;
	bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZmONvWjWeFncpkQp3OwIPH1NWwsok4OQFaM5G/i7CjQ54QwaY17GbGOujE11OW2R5kbb5yL6KfHFkpcKYCW+d2C8s1wM3H84hZ7jKSykzpEELecnUleRlgYO2ovIHuoLMRTIgtfOYY/D4+dMDz9oQkX+Pw0n+myinn/+xMQruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oz2XrnRL; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oz2XrnRL"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4783964353dso1691228137.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051723; x=1712656523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
        b=Oz2XrnRLX+uME+CBSziLRCDVpzIln2BK/DBu26vVhVX6Tv8+nCUnLNErJS8FKzUj26
         xDs+4yWjE38qeGTM6be0uy/EAku7++qscR5wlNHLiAeWRbdFO3oNZ9z4saRqOdkUrje3
         8guI2bdSRiayVsKYvxrh64OgIwFkF68zsnLj6W4oylGnuKJ8YZmEfCHqvHCbOex8AIjh
         HyaNNUNvLSwU4sNDSY5Wcpc3eC1Ju0FiH7sJnGkIYdISzWj5/iP6Az7TKRiG28qK0Min
         1oTt3KugWciJN7cYiLKLubnQsjJhwNrPNXiTfC79J4+JsRRaVRfV5J9XwZlW4te/yRgA
         9CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051723; x=1712656523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
        b=FbdyotA/fxLt2E3UXLpovDvhIVh5xWa2V/MzPLuxmGwhea3XYuTyc+gcovX9WX10z7
         4Oy1Oxp8USVZs/X2O52RufUcRU2OKZ93U1E7kEAztJv8gNaW825zcSJivo/n7L+gqc/R
         EZKLupFAhLDIUuiX4D41UPQ/Kr+154thv5lVjOPnmp6VqqwODrfa+Y++UxYtt+10kbdz
         TVi7Kt6JAdSgDRGufljc2knkq91Ac77zh1nflSjGDgZMuSfQGQtgQjFTHhWqA49gyz7S
         Pi1CKjDs8Diux0gg/ghh1gqO5cj8cNtzK0S/OfkI+3POGEiDAP7KGQb7JGmZUEIN3mE1
         vLRA==
X-Forwarded-Encrypted: i=1; AJvYcCUP+md0ZtyLjYrcVdv6AvSKyM69a2IA8pVjMsWTrJHnizaojNQ9sG/59ZIcl2jMHBQOhvDbjLVdOE849n6Wv1HEmYln4S9QP9FK/VtSYX0=
X-Gm-Message-State: AOJu0YyD6aMFYEfNKy08GuJgjcDuTF/RNRpM/q1GC3TOzK1GUkVjNtlM
	UvSprAppiOFADgJuwLZ9ZqZroMyiiDEC4QBnaSCMwnl6LN8Dr7EAvR/BiUFwzmQgjrs80EW9NaQ
	y/gFQwqzKcRe1KfF4ZYAjynCyhUG+h5YG3Qln
X-Google-Smtp-Source: AGHT+IEcu9bQPdWBbDR9srTAs9tC4rp1YEcz/A6uAognyfQwZDUdoacCnoOivbqDRFhPJKKxEQgRVosZhNrjILkSNkg=
X-Received: by 2002:a05:6102:b11:b0:478:8119:a040 with SMTP id
 b17-20020a0561020b1100b004788119a040mr5557763vst.14.1712051723373; Tue, 02
 Apr 2024 02:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002622.57322-1-ojeda@kernel.org>
In-Reply-To: <20240217002622.57322-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:55:12 +0200
Message-ID: <CAH5fLggsHHVsuXgzHF4eEpScDTp4pUwaq60tTi9CyL5JfuTFtQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: use `-Zdebuginfo-compression`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:26=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.74.0 introduced (unstable) support for the
> `-Zdebuginfo-compression` flag, thus use it.
>
> Link: https://github.com/rust-lang/rust/issues/120953
> Link: https://github.com/rust-lang/rust/pull/115358
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
