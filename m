Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3679A2DE71C
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757327072; cv=none; b=R0gNzCnkQkh8kkCxDKIcXEo1MrYdrHNxKo/QljlbRxaZd1Yerz3+7z0EDp89X8O+N/o1+SCMjxvSwpFO4ToA3QVgjUlIgKpFVRiV6j4vhII2/qyYxnj6XRQ/193VqW8PGjm4+GuQ7nYiCsUBV2yVFmwx8EqyFpIiiODOwhVmJn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757327072; c=relaxed/simple;
	bh=XnWf6lKHXJUHU3vhe1YUuEdjO9a2CX2ypi/RZq+5EDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd4P52jZrKOT4XxZ1+glCfXDDpIp5WzadlH4GwgMoksY/MT4xZqBUKcKT8Wjh4ZM9RNardvZreA5Y9PM6Y6HcmnN7s6Sp1J4/u1zAiQTOJDVn68/JNPvs04SKJU1aaoSVwr50NSKhT17bh8Sh33+1u71cP1BqWgUZ/zpowH2FF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y/5QVI7n; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y/5QVI7n"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so3757116e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757327068; x=1757931868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwjChtfYMEeGuB/wdk7FN7umIHbSaximMcCkeQ4PR3g=;
        b=Y/5QVI7nhI6iFA+QCwmSQAWL5DYgynJTHqID7hupV7NjgLydvj/1xiLYreY5L8xnm1
         I7gHAJ0WlUOouVccC3XKhqIsp4DZXu3nAt8urrYRIKZsrsZZIEezh6kIECBlHl8fgCde
         H34IKB3QW5WbS/m92a9qqg3l1xFTZy1En+syOSZxI9NujszwVgzoiow8yoNCwSikhkLn
         zHKbI1qRPnoWplh2iXa86AFtVEDGNpBBQWk9qbrSfEb7rzhi98b+M1wVftsv/6Spep+9
         hE/hjQcRSAri15PHdhtXtx1Sb8uWb2/gQLaEE5HYy9f6sA1roYvxtNZPzvoQbcqeowx9
         do5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757327068; x=1757931868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwjChtfYMEeGuB/wdk7FN7umIHbSaximMcCkeQ4PR3g=;
        b=YRlCN5Joq5yI068lpRRXe1wtTN3FYuY+mS3qrwc4IouF9DyHDXZAHdo3vXb++ctp98
         RWKivPFa1i7jrQPVzsCOGM29WuIdy/MygGyrRAdkocO23r3DRAxcojGp5RZiwzZVWX8V
         ML56ncV6PJs8cn/GWZkeKWOJrw8lrHZZRWVqpMRGPSkt+HHy4f6SCBP74bg+P9+aAso0
         +sWpUqrPi7BlXEGQ7+JBkmCuL+TVb281E+RT0DXOzAcrRlHdkthdBN7mnupRAktYFhVs
         FaJ5G00hWOCqzXOPLToR44QiLlmUEqDlCAvX5Ye8JiP0Ox8p6XvEtjIEci4gJFY79q68
         ekIw==
X-Forwarded-Encrypted: i=1; AJvYcCUWuGG6UtRDZQgAfEcgp8NLjAXEv5GDyImqe6K5pp6gxf86jhxx0qdCeTwcQgkycXgpsAQgz7uZO1sQqAIWhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGdXTHOuFZ0nuW2fqdL5Apc6W4ArmwoK4I4SM8Qd8EknVWhtvp
	GA4+Dd+v2YTaF3HPW8uX4uM+85lKCcxd6JFAq6JlItohvPseM48o4j9FW6M8Ty40Nr4/zXIab17
	VDvMzxhjGv81QBklN1ztrYvs8UQTcoRuxyU7s8hg82g==
X-Gm-Gg: ASbGncv06FxfrMHNSZbek+pY2E19lywbcX42C/YCMRYiqbMrh3itqMZax+GWCHKDO3r
	/RddgBjUG7d6/YrgO+UqMGRRHxxhFv01NstsLRKLuvMK8AveJnLJksG/ajbsRhBWznO567nDRSA
	ADnPhBLBvI1E6A6dVAg4DtooNSMp6zzKb+ZYaz5lAGiXkTggdbjB8/l8+BheA9jYUCvYyqoTaGR
	HBEPY+qYQepg5TTGpYSNLyXp7ymtuIo13+3VcFGWXjA6TiKnnc=
X-Google-Smtp-Source: AGHT+IEU92SWFcqL2QLe01sPUZQ53vA4dSF+LeC1eGi9vzhaBBHpAD5T0LpNw8VkFQ7aMMrmY4T/VkWVtAdVP7ScVQ0=
X-Received: by 2002:a05:6512:3984:b0:55f:4e8a:19b9 with SMTP id
 2adb3069b0e04-56260873705mr1755433e87.25.1757327068230; Mon, 08 Sep 2025
 03:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905090819.107694-1-marco.crivellari@suse.com>
 <CAH5fLgiZnCbNLpuphv4Kgsu48kRkhf6wJiSLrrgsqyEDvU3X3Q@mail.gmail.com>
 <CAAofZF4a6ARXOS0rmK5zY1Kd3xdODqdkj_keZmEYx8Z-JRvhng@mail.gmail.com> <aL1lkN5WcWkwiq3S@google.com>
In-Reply-To: <aL1lkN5WcWkwiq3S@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 8 Sep 2025 12:24:17 +0200
X-Gm-Features: Ac12FXwzRONvDWlYnRSSfpeI4s-lFdpCX_TWM6Wio52dNFtybcl11454WB4Q3Oo
Message-ID: <CAAofZF77saPdGYXt-oYkfV=2pRCRtso5eJuw+FqmS8b8WERgOA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: replace wq users and add WQ_PERCPU to
 alloc_workqueue() users
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 7, 2025 at 12:59=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> I mean that instead of:
>
> +/// Returns the system unbound work queue (`system_dfl_wq`).
>  ///
>  /// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
>  /// are executed immediately as long as `max_active` limit is not reache=
d and resources are
>  /// available.
>  pub fn system_unbound() -> &'static Queue {
> -    // SAFETY: `system_unbound_wq` is a C global, always available.
> -    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
>  }
>
> you add a new function:
>
>         pub fn system_dfl() -> &'static Queue {
>             // SAFETY: `system_dfl_wq` is a C global, always available.
>             unsafe { Queue::from_raw(bindings::system_dfl_wq) }
>         }
>
> and do *not* modify system_unbound().
>
> Alice

Hello Alice,

Ah, perfect. Yes it makes sense this change, you're right.
I will send the v2 introducing the new functions for both the patches
in this series.

It would also make sense to also change the above comment, mentioning that
system_unbound() uses a wq that will be removed in the future, and so
it is better to
use system_dfl() instead?

I'm thinking to something like:

+///
+/// Note: system_unbound_wq will be removed in a future release
cycle. Use system_dfl_wq instead.
pub fn system_unbound() -> &'static Queue {
    // SAFETY: `system_unbound_wq` is a C global, always available.
    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
}

+pub fn system_dfl() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
+}

Sounds good?

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

marco.crivellari@suse.com
