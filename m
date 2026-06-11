Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E332938D
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781221043; cv=pass; b=DH+U9RihHM/LnLBz6M5lC0nKXNZTp4CFd8ZOyeGajTjn7fOckJDzlPeJNtbzwjEFckHiDkT0ErEixhPD/Dxfs7ElPowZW2zRjutWDLp8fEB8431VpCrd8VXNz3JWeGDu7qG3YrLpTheIttkg1jUIwRKBQgGqzMWwzNSynWSxd7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781221043; c=relaxed/simple;
	bh=gjdeRmu506FNZE8KKYO/SLSnu+aTXdYHEZ9P2vXcq5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0Ve6Z77iLAu2vbAdSm/HlwCSBSm8QnaNan9+UaE5TrevV6ocjiUYZMv8PDqji9Z6TlaQbbcH2PwrpQ0/AZa+OTO+1n74FAv384/11jD3RR5Dk1LpjQ8qqxnW/Bzr4b1ZicpprgTxg6eIIGT6QoJyA0iZwsTvCdC+lUU1MLXSuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JHc8EOUB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHc8EOUB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so2468a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 16:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781221040; cv=none;
        d=google.com; s=arc-20240605;
        b=KgkfPtvLINwKCSkoL8mkNDGWflclKqoaYMrOEuQN6t2XeVojigWlYZkRdCJ3y3Rzc+
         omKAQ8Z1PmU52gR88GtvvOSRzV3KNcPFCnhskdCgph4LSIeDCIq6FuYZOGnc/xsMAVvv
         CUoIe+kjSltOjTKaZZ4xvFV5Hx6OdOkVqYSC2/AXAqFOXzmHlNj1tn1amjvn4dDUHa0U
         vU7pLxxcejT06oYLtHSLnNBvZTxo5xPDTQpl5VOuJbMbmFS7leNoBqdoso49i29/6eTm
         iSpILLofSv+gyZWLlf4MWHojpCosFvXbrakyUtMx5V4Qb3foe3IYG2aJfZHDHnj/wq6A
         1IyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=acL42icRgm08nMWGb7OQi5OmDozHru1hruH7sK9Wfok=;
        fh=Z2CgqODMxOwwpC0defCv61RiDKkrzrmA166QBl326NA=;
        b=iILVWmLPksbsEtBNtGnFWw0Tt8XF65gG3OTPIUd1rx8HDZmRh9rxFte0RcPHGPMNCw
         DNIahz8AH1vTZNGz8FvchhYO4b1kCn6QFGTEAiekHSpmbvPAfa1dIr6RMab4bHaciH5q
         pyJ6gtLGDgY592m4zVmZ0S4cb8Yru7A9wjqAfhcPlzlFHr2vbWDmWkj35scqC3caxlh+
         Xp6oHk3iexI4Kj8R5prEWEjhstk9ZKxnhd3Ydt1ggtrQ5gQZHNfUu81zEk55YcjAb3Yh
         U0LeB16nTRY0CG/CC4GJI4mq3nQbfxpKgjKsILXmrGH9qeHvbegiSvRgqhPSCa1Xq00D
         pzBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781221040; x=1781825840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acL42icRgm08nMWGb7OQi5OmDozHru1hruH7sK9Wfok=;
        b=JHc8EOUB/GMwM8srWnD3b2Ds5tCh0pbvEHflMmJ/PuoRnKA8z1smLGVRcxosKeh6N7
         /e9eYFKIldGgxBkYgyNbAV/mZR49m8Jr2oSjmPsRYM9OeD6anGDmwhkFoJhEgTMtkLed
         yEkX8Aw+J8+Pqcre0jDFM9vpmeXdt48TB4sAUA/M3PKegdQ+oUznFjeZj17yZwt4AsRC
         KvTNQ/MZCFYuvFTVW5zr4vruJNUWeIGwvnzcZCC+45TVYFu0XEG2vzY5gSqwXYcdCHqR
         MiNtH/niwsSxSzmVXzJ5YOiiRlfD5wVEi7c0ij859QwbovJyFZvEq5WMTRfRmuMIYie1
         wpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781221040; x=1781825840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=acL42icRgm08nMWGb7OQi5OmDozHru1hruH7sK9Wfok=;
        b=gjRVwjGxKJAdTtg9oob2NVGoyJPRZZftY/ywEqfV1Hw6PF6eT8eTxLOtFDBTKoz6om
         2kiCwELb5d5mpQ9vpDOO7cdNF1q7Pi/zWRnLyUAjhHvrCIUD6YmjZqw6EQP8z5VhL7PY
         SAQ0lXkwmxQfIGvMAFVzTrRlxfLpWT5urRb9FBAPOGzd2si3KgD8Z9+iRfWTNOtCNVF9
         YVsvZaDF7vlCIQpiISJWjGhp/d5jI9g40Zhwpbm8Nf/zvNSDNiTfKWXQNKmrYx+5hY3p
         0yQ4dPPqxLg84ueSOkstbVg7jx2Xy+zku3GxWPxD0ktu8FRnKEzSrVJQXgivaCbKD++t
         avqw==
X-Forwarded-Encrypted: i=1; AFNElJ96qz+tsY5QN93C6Ym4M/CcsznlXBF9UVbs6WPa3TBjcJ1vgZA10G5hAed8EMjUeDbnGBpyWHpOh2IpR+Firg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/N6NruJOc6r+6eAKltYQx32rsxHOdDQiDRzV/mpNDOap7/UG
	swpX/aESR0nktm2rEZ6JZtVN2xDCfS6LvOIBMHsQh4fRKqbJi/uErO9dT+9SP/fZZVcpkmIdedf
	RNmOP3o9Ag1MoJQ6f39PnknqR9ZLj8JimXv5eeNPy
X-Gm-Gg: Acq92OETfO5AAkqYK3lSo5hxAbbDoDzc6au0nwlReLM4FeUtHOk7ufT9i4SRl6cSJdZ
	kkd7pKiTBa7W2xEyWmFuzRkC6MZAwPoiJBLA9//kb9GV29+mD6QBcaOjDnqgnse9OlUy9Fy0sD2
	HHsc95puVIs6ygC4DTwuo74oIsx1sdf4Rhd8fjfL62uElxrLzF0edlQfog7U4yEmyvPr7edyAqf
	6atddtcZ8o/3YPXEwqS1dDrLEmKW0UMJl4MspuWgupsKcLQrp5eeyU+5NMws3TdyZ9cUJUeqGGr
	H3Zq3+Piu78StNNeTzUZSg+xbb6kThVWMKoT
X-Received: by 2002:a05:6402:b8c:b0:68f:a01a:7677 with SMTP id
 4fb4d7f45d1cf-6936e5fca33mr7362a12.3.1781221039861; Thu, 11 Jun 2026 16:37:19
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-6-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-6-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 16:37:08 -0700
X-Gm-Features: AVVi8CdVqlUpuSCZ0WlE_N60eymt4YSKbXSeIQnEkNFzoebsfek5HKv2AZCplkM
Message-ID: <CAGSQo03baCzz_jP-eA-ZpdM7xz-AWNkCURKqyPSZxQgHi11iSQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] rust_binder: update Process::node_refs to use SpinLock
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Unfortunately the current use of a mutex for this lock leads to priority
> inversion. Traces have been observed where a process is trying to obtain
> this mutex for 22ms, but it's unable to do so because the thread holding
> the lock is scheduled out. Since this occurred on a UI thread, that is
> an extremely long delay.
>
> Code paths that might sleep under this lock have already been updated in
> patches leading up to this one.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index 268d78f8cfb3..82c34a93660e 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -30,7 +30,7 @@
>      sync::{
>          aref::ARef,
>          lock::{spinlock::SpinLockBackend, Guard},
> -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, =
UniqueArc,
> +        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SpinLock, UniqueA=
rc,
>      },
>      task::Task,
>      uaccess::{UserSlice, UserSliceReader},
> @@ -455,7 +455,7 @@ pub(crate) struct Process {
>      // Node references are in a different lock to avoid recursive acquis=
ition when
>      // incrementing/decrementing a node in another process.
>      #[pin]
> -    node_refs: Mutex<ProcessNodeRefs>,
> +    node_refs: SpinLock<ProcessNodeRefs>,
>
>      // Work node for deferred work item.
>      #[pin]
> @@ -510,7 +510,7 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> =
Result<Arc<Self>> {
>                  cred,
>                  inner <- kernel::new_spinlock!(ProcessInner::new(), "Pro=
cess::inner"),
>                  pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKE=
R),
> -                node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), =
"Process::node_refs"),
> +                node_refs <- kernel::new_spinlock!(ProcessNodeRefs::new(=
), "Process::node_refs"),
>                  freeze_wait <- kernel::new_condvar!("Process::freeze_wai=
t"),
>                  task: current.group_leader().into(),
>                  defer_work <- kernel::new_work!("Process::defer_work"),
>
> --
> 2.54.0.1064.gd145956f57-goog
>
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>
