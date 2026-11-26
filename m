Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697002;
	b=Wvr2V4/F6ey238Ak3AlsAnYdknlS5GAdM4GXw1lr9V6+0KCZsrYWpmNwMs3fzg4v7Gyi
	 ZfSSOOqzvx5E4pmdQ+84Y/L0TXJRvdF1fAJWFToMn30YODWscIWxLKHlRmEUBB2AanyTA
	 JcWUOasslNy6URECb8wOpt9gCivgFTdxRU3YRJm3obaJ5Itv5Jhp/pYmDhPpcN3ba346O
	 c+XQgr5TLIEr3EU1Kuf8uEGr4aCJf54dFo0O/xbt5FB334/76CGxwVjifWabjp6uJCZun
	 +IO0aEYkd8KEpUeF2cTSCQ3/sNXgwIdN6Et+VPMQ0mBZ1VzoekGopa8a5Rig4xUZNUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
	b=xCeDIocd+joyrO7uFMussyfiJg9DITBEbLAJFS8IHxnMH9Ec+zCfjl59EM3NAR+kJURs
	 Uwn6cuTH1WhLk6nmz6HqWDeGhNiCAdF1/Lh4EyKzbUvrsJVFhI8hGDRk46fyDJ2lDNuOp
	 I48TqYx75cHwFKqXbrYfQTE/PQf5/gk0HHcz9IXlOnWDNhJJYbN4zhuFpKYiqGgSSyYjP
	 1EYXXZBWnysyZM0fEVq0rRWgIsdozqU/AQ/3GtxmQtjBRvmk5LgLh7+Nm/lsqd8gKi+t0
	 xeGafpV4JHrqrCtTbVD3lGu3qnO/uuGfYEquevqdAH/cTFVSglsyBGFh0we1/Klv4Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O1Hx2dsu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C6B606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C6B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O1Hx2dsu
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491846221ffso6061226f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 04:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697000; cv=none;
        d=google.com; s=arc-20260327;
        b=e6WBQoWyKgbzXm2BRa+EzfikYWtapZo2MbVUANKSnSnfFpDM9Z4YEAONRdBUJfbsl3
         dT8S3g0TJV8m73BSUNT/G6Gw5NeDYcVHvA0JWe7WiOSoGIl4h5WIp6AxAzul83PvXyx+
         jEznv81yq3HG6v+Kvpm/Y7O5X/rslShJ5ldhEjj3E9RTwmZ8YwXa+ggLyjqnRXngYCIl
         bCFP2Q09tjlRVDApL0i0krKD7hJh4Y53uMjylwznaKUuUXouE8qZLsCEs2q7hQcpMckB
         uzToOY+0PYZzhY7Yb6ZwJ0+MbU/yKY7j2Ag2bN8eX8zi2Wz/xOdMuFXSoAZTVsDi2xJp
         zTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        fh=CPkh5ZJMb+WZV+2BMxlVJZ4YlK8ESsACtgpn/OaT7v8=;
        b=nh55RV10inJGJjgoWqYIE9SBkzktNWycOYkrGcwFo0p4xCLk2xuWvOBxcH5PbS5yda
         z3DJxGBNeJ8f6buYAOoZMG4V1T8zH0zSxv1EnNKexMGUkE1McbwO8c+2I31SjfaXZA8Y
         RD5FNXcbrO8Xs6bYScTWZACShVVO6Gmc782KKUxGgfaTL2ozGeAac6PtUcouOi+SweQ/
         x1qb57aC7fznTGIM4T36wo0EttHjakcpoAssxisKoMijicJXmrp1y9bgbQX+ULVpBGLi
         8AMgHwr/KftC7YFDPbSDw85CDdT/dUOBUQuOgHoEu/3B6J92v5Ox+kIrF7W75T5XHL9u
         cnMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795697000; x=1796301800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=O1Hx2dsuq10/oTIOFgdevzB1nCddtbfQ2o7VJksECNBoidtdLwaAR/syeHDZWp1w9/
         03KKURVL8fYcZo2CvY+L6Ogs5vAepAUn+WL8hKy6Hy/9xbM/JyLeHHmVIax8uiE9UINa
         GU0jwSZrg8cFzjLi9wo4y4gXbYsn3JXaX8Y1OPfjTTxtghFe176ExLWZbTggHc1oNuPY
         /8tsPOHhoyrfvDBhf7X87GtDcyfc0Z0yUB5+yZ1nv0BIeyMUHSGIIUfw6/MMkbFoMtLT
         vQMKU2ToW4NfSs9XP2lrrRlv5nwaSf72+WMH6R8CantHxXBQeQXVaY/eQQpfDolkFw97
         xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697000; x=1796301800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=z1JqTEC4yLOcIwTApqiaGnL4ZNn9GLP+F3LgGy7k8cQpja0MPrJoltiLe4uf9/j2AU
         /5Tb0sOFAUypygXR2EgeNGmtxi9uoFaxkiWFCTuld53kTAOwkY1BlmRU8u+TXjdGMeZE
         MzfR0Wwf3XeFkIfFUnTbVapMSb7eBsAi1jRKPzXgLQNSiRbGHyFgju+0CzcGI/fjHblA
         56bFT54mVMkRhI9TMd8bs1eifxtt62R3ovorNQ/s14LGkLPu5iI9+sRqMAOA8Hfd/Sim
         AY1bAOoCkAcuyrJxEi1Xd7ogHFlhzfcrz2yyO2GV4+YrjQdtZSfJBd39SgvibycdjadC
         jd5w==
X-Forwarded-Encrypted: i=1; AL+hErGx8xotzGuKLNLY/tW8wfBUbLVijtlySTaN7Je0eMojI5SAz0415jzbUuje6I2wazhOE3goFD+crEbJZMuJKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JUO2WS7pVSZ5tm+MtzGBRWDq2Q/nhpB0HpUfh4NikpAekVSEX
	cudvQ747XXAc+Pq+07A8M9PFZNYygoNB9/Ih2WBZfLIrhTmegxmFtH/Y6Smu+czV6TVAtB6zfDN
	am1+OC6nBLUCZAbCrUW3AJSa97mD7AHBVuEv3B3Yg
X-Gm-Gg: AZFdTZc9lcmsJVkvgfvMWEL3oqKSq87fACXJcpjxh5F2A//JCKqkBahK9zBDLKuxuxE
	IafYtOyiEkLyWLaRCe1NJXX834xjoULXCvUfZ7SJpXqJCkMXCNXK4UVXE83zfayP0AEEiagJZl5
	FbI3wkMK6fGHlkAUUlFJ0hbMaPNMdqiSxiNxgSYoX6suCRMDCzsDSKDqv2Q0ZIGzd1TDO37wEwX
	O/3pTGtJiaUcT5B5DcpM7GW1Zli6+CaWCnPVkuFk0vnBpzx09VSYJifm+JvyUbjJiv1weLLEP4K
	kP3jY+UmNE60sqW9J28K5rXKxYxhzQdYZKa/fmTqLbzxcSKNdrkOqlXMlyyFUNP/bk0sg3D3wv7
	1iI/q5g9Wn+/N2T9vyKzRfVzR5kb9kikBuSE+6KmpFQa95d5O+PwlvJH93E/thtu9ieURSKYQIB
	w1CZxF0srtTOW/Bms9R8vQmsnm6jJVDn9xQxj1BmpT9YI0
X-Received: by 2002:adf:e00f:0:10b0:491:d224:aa78 with SMTP id
 ffacd0b85a97d-4abb27275e7mr29748444f8f.26.1795697000100; Thu, 26 Nov 2026
 04:43:20 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
 <20261125181752.2027207-1-aliceryhl@google.com> <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
In-Reply-To: <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 12:43:07 +0000
X-Gm-Features: Aa3M54p00DMhUzh_tewZfWZ2hi0LG_ZMSKy1ua0nr0PKeO0HqjITQRZNecEPYTM
Message-ID: <CAH5fLgjvFXX6oZRkH9OFCun4eNGWKkmoeCfVK3_16Yc75dfRkw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:22=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 25, 2026 at 06:17:52PM +0000, Alice Ryhl wrote:
> > What I'd say is that this isn't the only way to spawn work on the
> > workqueue. This utility is intended for use-cases where it's convenient
> > to do it like that (e.g. because the queue is defined before the work
> > item in the same struct). We already have another way of spawning work
> > that uses different ownership rules (e.g. self-freeing work) and that
> > mechanism would not go through ScopedWork.
>
> This is your design and you know this area far better than I do, so pleas=
e
> take this with a grain of salt. That said, I wonder whether the interface
> is more tortured and twisted than it needs to be.

Always happy to discuss! Thanks for the question.

> Workqueue lifetime seems to add a layer of ugliness, at least going by th=
e
> restrictions on ScopedWork. Wouldn't that be relatively easy to solve by
> adding a percpu refcnt to the Rust wrapper of workqueue and tying work an=
d
> delayed work items to it? Dropping the workqueue would wait until nothing
> is pending, and cancelling delayed work items before that would be up to
> the user. Work and delayed work items would then behave the same way and
> be usable on any workqueue.

I'll take a step back for one moment. The previous version of this
patchset did not have the lifetime in question. Adding a percpu
refcount doesn't resolve the issue that made me add it, unfortunately.

The problem is: if we drop a ScopedWork early, then once
cancel_work_sync() returns, we may free resources used by that work
item. Obviously if the work item is still executing on some workqueue
after cancel_work_sync() returns, that would be bad, as it would use
resources now freed.

Originally I did not think this was an issue. I assumed that if
cancel_work_sync() returns, and there was no concurrent resubmission,
then it would no longer be running. However, this is not true:
https://lore.kernel.org/all/20261118-ordered-wq-cancel-v1-2-916e01f9affe@go=
ogle.com/

My fix for this issue was to add a &Workqueue field to ScopedWork and
enforce that the scoped work item can only ever be scheduled to that
one workqueue. By only ever using it with one workqueue, I know the
non-reentrance conditions hold, and so I know that when
cancel_work_sync() returns, the work item is not running anywhere, and
hence it's safe to perform cleanup.

Of course, there may be other ways to enforce the non-reentrance
conditions hold, which could let me get rid of the lifetime. But the
lifetime is there to handle the cleanup before destroy_workqueue() is
called case, so a percpu refcount does not come into play.


Alice
