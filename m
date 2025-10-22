Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2826CE2D
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761129159; cv=none; b=FyYS0qzdvEZi6TgzQWaGOdwtj3SNhzdmH2gyg8M7O0xRt2gfE/wm/PE1bsgjWeHyxRzJW6LBDpjAqMZfCqjp5No6GcqfguDtHGjpQcSH78+oznDpQJv9AggvdCdiILud+AEFI/fmpV1Z66YhpMX7BMyT9J/4LivpejBWD8nGYPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761129159; c=relaxed/simple;
	bh=CiZOns0eToY7P9gv/nt/RsalrqWoAl93Il55RBlfYbk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pSsQlCkVN6sk7BGNixW1l7Dam3eXl7k871C85yPL+WC+AF4jay9EQMbXOY5Kw/dMTyVjoZLSst2E9QBdhkv/uu6amrAdGKWF9MB8utcUJAHL8YRJPz53oMEazSyA9+DNOpRVZWuYh+16sRiNJxRHf2B2VicuyWDgk/2O6Pq3738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BylKF6x/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BylKF6x/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33e27cda4d7so603732a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761129157; x=1761733957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuRqJeC65yvo3Lmn1DVO5+nHc8XAm9gp/N8GuccccSQ=;
        b=BylKF6x/iZ7CI8FR/Jx38DawfXHqouFeE+X20DxeHCGFgZpgOTUcL2MZ06gl5TwDpJ
         P/LeTNKLHcdPJot90V4Fxm2mTFUrPNTrzJMF7sjjjjmGg88ErSxuOOS5HlcgBVoLKZqq
         COX19mg4r7DyxqZkIYsXixFds/zbC2CgfxpJUJlVsJ5H3fzo+7SUojBZm5SBULFhpAKd
         5V4U3l4MNsNALNsF0bziprcPhNaOIBjXMILGKm+ixay0sZtFGYx9dhCpby/v38DGKuNf
         A8ElasNrjAnjQHG7L/Kxoi0p0/vnOoELSpkUOxPktXjGyax1L0AVIfPR1eFo2+/f/+fp
         U81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761129157; x=1761733957;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuRqJeC65yvo3Lmn1DVO5+nHc8XAm9gp/N8GuccccSQ=;
        b=K+NtWS4abJQYuT2qdNvHi9jI8pFByMbthTk/Av0DbCobqXnHRc28vmLQflowkxBaI6
         kU6/d6EX22jruAzVYu1ZTL3P3fGSroOIeeD4tv0om/blVeQV1mbPv2FBrY6pl5IUG/RK
         4cZhovK4t8jPZzRASAQ+yYackCTalJXdGetm1gHkembHfbbEC9ofGQiRtyKzm6elxQZ2
         n5lBDBL5OAdB6DUuPiKGIXYc+6B33pL2Yt0Y3EEwmjBpeEPZLTTRVqKPA7L3c4AXA5RT
         szXubLl+XOVqynekNN9vb6H+Jb0lObArVnZXCZMrlLwgHYRNaUHY4MlXlpTvukqBEaad
         YfAw==
X-Forwarded-Encrypted: i=1; AJvYcCVWykoDTtvMOtRCCNoS9ftv/HKYsEZ7L8RTIZXDGUdsgwq4LMFSQm/v2MoEexL8A4vSqkTOUcTQvYwr5RHVIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWh7kBUo6mLbXGZ8L5I5ACW2oyVzMLJ/TIHgG27UorDAhAgzM
	jkobnevkZi3Ekqx6dfRwbTpM2tCzb4eD2u76744SY1k9CKfs6KlN/fJC
X-Gm-Gg: ASbGncuvBIN9oLGJKJ/oZt2ZXPfiO0Szsox9Lxw0uYRPblq5DGqD6oIrM7YMt5TsEZ6
	dehqDmGhBjmlF5+q6wwifOk5HxNT+TzUE3GGPYMOGuzvoDFbjDRqyiOXHAHjKaNrY57bcU57CT2
	0m5R+RbSnYMtKVIZhhW/e/YuzU0UELXkytyS+s2wRtUXSTcATts1fA0uSMWzJOoADE8Jnd32Dj5
	bSExlei1TeDX80d4hEq5kR97VRopHuZHG4OCIuVIzhziFWdrxmnfTB+XlqPLR09e4n3ckn7h4qM
	zf5zodcHDHF/fAkwP0WGe5dzhHsxkJsLwMon6I6gkkOYQCrA9kqtUgrV+u1h24UBJfx3D4y649O
	Bk7RUKuWK6JicPMSJbURdVoLALIUX5wCMDysrG0ms4dq76jguS8oTvn0yIs5IGPAI2XsRscRyFj
	A58VQS0aNvI9ZnfYbUD5eDZqEyj+QZ+ZiHvNow9pxS8daHyfmOY75UGKHcFLpI5ltb
X-Google-Smtp-Source: AGHT+IFlZ5+t9Mg2OdV2xMBkVPCC9UkNcFEp9TCLp/fsD6NdnQ567HulFK6cKVMY5pofdf/Rt/bb3Q==
X-Received: by 2002:a17:90b:4c48:b0:32e:716d:4d2b with SMTP id 98e67ed59e1d1-33e21ec326fmr3840511a91.3.1761129157272;
        Wed, 22 Oct 2025 03:32:37 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6caf129cbdsm8795116a12.42.2025.10.22.03.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:32:36 -0700 (PDT)
Date: Wed, 22 Oct 2025 19:32:30 +0900 (JST)
Message-Id: <20251022.193230.585171330619599845.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com, fujita.tomonori@gmail.com,
 aliceryhl@google.com, daniel.almeida@collabora.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DDO3OMBHS8TB.2LDODR1AFRCU3@kernel.org>
References: <DDO3G26SIZTK.1KV7Q0PQXHWTA@kernel.org>
	<CANiq72nUiizxo3YFgxUZ1jiczRNbY2ATao2YUBiCEC7k5hbv6Q@mail.gmail.com>
	<DDO3OMBHS8TB.2LDODR1AFRCU3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 17:20:41 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue Oct 21, 2025 at 5:13 PM CEST, Miguel Ojeda wrote:
>> i.e. if they aren't sure what the value is, then I would prefer they
>> clamp it explicitly on the callee side (or we provide an explicitly
>> clamped version if it is a common case, but it seems to me runtime
>> values are already the minority).
> 
> Absolutely! Especially given the context udelay() is introduced
> (read_poll_timeout_atomic()), the compile time checked version is what we really
> want.
> 
> Maybe we should even defer a runtime checked / clamped version until it is
> actually needed.

Then perhaps something like this?

#[inline(always)]
pub fn udelay(delta: Delta) {
    build_assert!(
        delta.as_nanos() >= 0 && delta.as_nanos() <= i64::from(bindings::MAX_UDELAY_MS) * 1_000_000
    );

    // SAFETY: It is always safe to call `udelay()` with any duration.
    // Note that the kernel is compiled with `-fno-strict-overflow`
    // so any out-of-range value could lead to unexpected behavior
    // but won't lead to undefined behavior.
    unsafe {
        // Convert the duration to microseconds and round up to preserve
        // the guarantee; `udelay()` inserts a delay for at least
        // the provided duration, but that it may delay for longer
        // under some circumstances.
        bindings::udelay(delta.as_micros_ceil() as c_ulong)
    }
}
