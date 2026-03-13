Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D242390C83
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403232; cv=pass; b=QGpXXEyQECXcjxD7CH+xPbXnuMivJRz0sW1HGuv3qkH7QEdHJ4pYtVAm/JwlfH53ma3IJp73TPO76ic0UgUWGr8EfHPKRaVHaVjk+y1/p1oIKZMBVuM4hQahMhpV+fyQNL/rl3Al45sakfOimugCwzfMTmT3I/gZRu7w2v7lBIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403232; c=relaxed/simple;
	bh=22kDvrrhK0yXMqgrxeP3c6v22QzXMXtcml2dEApSMFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqUV0e+o3bRFeBjfjpCIrHODazvZ0h/MQKQtLlPKUZHglY/DKk9qm8J1xQknJbfl8IhJg4X0c9zhaSNvFLBt/ynV4pGdKaLyPGTso4LVeisjReE9VeTLz41N4qw5ZRNfb75bcO5efPjNWn3Fwv/LPH5vg7dXt5c0U7ITdt7IvNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KeJok2qX; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KeJok2qX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853aec185aso18133485e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 05:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773403227; cv=none;
        d=google.com; s=arc-20240605;
        b=T4YFgGmpyBbezxdcR8MT4+sU5rQx3nxreP7ozuxhczvX8UMlHepu+80AU1Wv++9H2i
         Wtm3lpD29lp11qN87D7gBcdFYc4GZDdTWDIRwt+/OI9MmR8ImwoNZI56hqp4wcRvEfwY
         s1feQTJHXYgmC1HzEIhy9s+f+v2IxkrcxO3dKsCshV508j7bcvU30DHSNmlNoxI9Eip5
         6l9vsMGJPMHltpRiVvAdPlkKQEyXNUU5VYRrYT6i+aNolR4vgJe1S429DogEy8fzE7N6
         RsJ/Ok8GfkxrgSHV1zUQvXtV8T1w9bkgiBICbNiBBhkqOqNyhq6Px+0KnwTid/LKmWx0
         0GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LTIFZfVSy/HsNH3KObZHOq0ZyU515+2Giryrm+nhHg=;
        fh=+rU8R1+BmeG5bDPlpPyIAm0TOyh2aw7qCg6OcLF7uTw=;
        b=Pd+ggu7u9wTEUx2kbj53sRaT6COhmBUHT1wNxxaR8GO+KCc3KeStTpnTqpWVtQrdpw
         MVGjoDdYX+efd3IR6pjBBzayZw5Bzm0rf5lvmbrb8j38eZJdqDFM88CZGl6AZOoDDuJQ
         V6LIBIFp3YL9c2+PEPyTnnWi+BQQL3+Nbx+W7qUow1Ya/RFyuJRUhI0RyOaKytwza5Yu
         kqnCkgD+gBkjCfp7j/Yq9xMlsOZCeRPmVEkYokPRGqB7IQ+gSNI+3hG/k8NmNVl2M20P
         N+YhCzAQiU93eJf8gnhKzV6IsEsdtlRYfCRPN6SJoVbOblgjkp7sD5vCOHwa5O2yVEv8
         28hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773403227; x=1774008027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LTIFZfVSy/HsNH3KObZHOq0ZyU515+2Giryrm+nhHg=;
        b=KeJok2qXNqbIA6ltEQFZl3u+2L+0y/CjaLvRvQTbuEgdCYRca4miX57cJiL6nYkLBr
         aszQT9qtCGmhkLk7fDm18jValKoQquuKwjV2QLrdy4dfBvuH06A2h10JYjIX4qV2zu9p
         XFmRXNGBzK3cKMRx5OfUiPfg2sfy8O69lck4naOhm5XpUKn4v3QvnmTCkEY1wMq1GbFu
         rdcJ54o+4U3+vWEXr9eW1d91Ib3J6uyNabN9YY2rGCGFSTRBSt6PHRPj3pnfzVPLWBkb
         TVPt9hgb9nRq16IglrTrFlYNoSfHgpQHBBXk6EZQUn7C2rJ8rc++dQEkpddwfoVSHcRY
         0erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403227; x=1774008027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LTIFZfVSy/HsNH3KObZHOq0ZyU515+2Giryrm+nhHg=;
        b=Zp9Tbv/TQLkbDiFuJma4QoYZG/gzyN1HnUagxkLGFqXwC1hN2ahUeyRzPh9i1LANSb
         ktxyAEzu1RPHtPtKwuVGR4eUuxE5sJJ5l6MozZVUrQd4y5peXYs2CVSW1WTARLvbgNen
         3jrMNJ4bQ4b/FOoau985w2DMeCaoyAuTuPNYnlEXhcunBMAJuKAtB8jKsiNQrR3PI8Bg
         Rp3FBEQ7nYavj81waXnw0s4eKmxrDGLS/UbIxFUVGvjeLxvidgB/5BMlsHtqBi8HY+9U
         Y5nPHqItEYAql/iabZwQwTl+amCWUM2ZvEOv/bQo7Ox8QazG49ZApjNi2i8w6aF+T6bK
         q8KA==
X-Forwarded-Encrypted: i=1; AJvYcCXVDqlCmDgs0TIvilLWqhhfTIsMZYC0EqzJOpzGPy5p+CxXOXw0vXJ6k45W/lHPjvM7+idfx6KcND4G8hn+og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgrIbUNvdf+12OPkzInlTtsCDZCmcNeaho6QyGY2caiuwof6a2
	8WFrwrPENYrJNhRoNi3vqESU2jvyEPsqQnW5Plrufw5IhmvBKEfA7+OUaMvzmIUWWmlps2WyuPZ
	jDbT/kyoS+cuHVZlE6f1bCSBHHj55MUqVhboY8OS7
X-Gm-Gg: ATEYQzzRetwKrxkepzUyUZnUEN/YWdQnKuRM48rZQjblHhgH7/wiK95qq8lx4LrMVm7
	Ip3tLHfiRiKEl5+LVQyIQDs8Ax22e8LL/HhFHqTSju2rPduOC7puM0b5EztqNa5Cg2+YwRZd0oI
	ajO8hHtGmxJQY5vtes7qFpc3IdMrNkLThti+LrqeRoGeQVCUqOTk+Zx9Gxb/TQCA6Vw34LYzIOV
	N33PxZ1pzA6lODwB7XEk9EE/BhZivdyZnkp2fQ6g4WUNc8gUvguoP5F6wJcCCULWzomdkstImub
	Vwlyp4qRt1DAOzs3vWi5RrwPTMEVzlKLgC6xHMSUQ8bQmgkuXuEoEe9+wSm+ckitudJBDQ==
X-Received: by 2002:a05:600c:a08c:b0:485:42ba:fc8 with SMTP id
 5b1f17b1804b1-485566cdb46mr43616275e9.4.1773403226928; Fri, 13 Mar 2026
 05:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313091646.16938-1-work@onurozkan.dev> <20260313091646.16938-3-work@onurozkan.dev>
In-Reply-To: <20260313091646.16938-3-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Mar 2026 13:00:13 +0100
X-Gm-Features: AaiRm52mH5ClK1vq2lDPbEjgPagq8eHcfKd6sbRZuNsCe1ubX7r91PcCPwWlYx4
Message-ID: <CAH5fLghXAYsa6NJY0pt6cq4qYiB1ZDAatyGM1GCj+xcpYy9-cw@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND 2/4] rust: add Work::disable_sync
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:17=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> Add Work::disable_sync() as a safe wrapper for disable_work_sync().
>
> Drivers can use this during teardown to stop new queueing and wait for
> queued or running work to finish before dropping related resources.
>
> Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/workqueue.rs | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702..6acc7b5ba31c 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -530,6 +530,21 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bind=
ings::work_struct {
>          // the compiler does not complain that the `work` field is unuse=
d.
>          unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
>      }
> +
> +    /// Disables this work item and waits for queued/running executions =
to finish.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Must be called from a sleepable context if the work was last que=
ued on a non-BH
> +    /// workqueue.

We generally do not make functions unsafe just because they might sleep.

Alice
