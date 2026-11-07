Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059808;
	b=rvs9xqhUeo8vLnV/06Mj9LoIP4vRRmRsBz9K4NEYLQgsJ/Ey3rcKrbII1zdzmI4vFUJi
	 pyOGaJs3m/vqYwNXBSbWBCfXpjzg4xztmsIlukm0mgJq3FSF1Kp3uaFDpl6JHQUcSy450
	 xULUoK2Ht0N39xH6O2Rj75OvAZ6iy69zbvl7Xw/VDaRH7PuvVc6O9eT8qKI7Fv3hIOCrh
	 Hdx+RTXqiCKDHK4OjpVreglA29/yCWRicB+QWIqk1vx/tGqsJO0pkBMY8kMJb/A3U00O7
	 j3p2RQ7cytyrJIzInoAZtkOGSzawpL2eAww2tfg7MpLoaJ7Lu4hTu0oORwWEMtZnwzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059808;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6TDIa4WBe03aqlzFy9TN8awAuksm28T92BfNeJQsqFs=;
	b=X/GUsEO3NyAxPpp6I0xgJar0rJHNDqxEQ99OdyVLlAdnbjFYqg04wyr/vEMT99/JAF7S
	 E1ncVHArwyd5XTZ+Y6Yzzv5r4b7ZzBWvskETlMS90ueP9jTwYt6lNXowQtI5NGjJQw3+g
	 LS9ZKUudBdehSEo585+pVndtmNfD9d3NyOc/IOm7SWRcoZu4mjcibkkyoyg+sZrDG08un
	 pem8Nr9cxPJ6fr2/7Jf5Ho2YbuiUx3pE8sS4x9hGrdEMg9C0KtIWLZBIue/dRkU6RJPE3
	 unQQ1dmSMOm7F99L40hMqaHY4ZgB+cuHnfxFx5wTFGg2fn24L+rpm+e8JiNHShMlnIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=younes.io;
	spf=pass smtp.mailfrom=younes.io;
	dkim=pass header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail3 header.b=oSVOeTmc;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b="mGhbr0/r";
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE76606A326
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 13:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail3 header.b=oSVOeTmc;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=mGhbr0/r
DKIM-Signature: a=rsa-sha256; b=oSVOeTmcxLLUBomE4OrFL/BBmxJdRciQ+RsuktVDWk3vlhuRgZoWvhhB4stg/BHIev1M9AgQSz6yk052hjxuIWUctFdf8YfTN3q2yjUoKNgbPcum8NGvVZqHC+fICJijAmNi/53PaWE8YiiximjVdfrCXCd4Ure5g+8cZncGG/f4AIn5c6WG+8HhMPOhEuvbcNR3Tc94EjvrvzMeY/vvrbwT9ClCGsW+DGv3Oo0Qw5lnN9euLkoaoRymFq34YjfEoHuv7dvFrisZRoGlKkkrF07WNrsg5uSYslncazQaoIQOGnJZJShDlguL0jhlHuezqMBCIk0pd8goyIyCJL/Kxw==; s=purelymail3; d=younes.io; v=1; bh=Fc6IXWLwH5VrIIY4TpPhp1GmAfGDN5J90ztlIHB9e0c=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=mGhbr0/r7rErQIyfbQs8b8HFkifVWABVgEVIcYD7l8kfYuVa4UeErsSmyEzvm3LVD3ZzHYbk5Dp7vkE600JNYsFlue5uWgkwQkYgyEP1pMVAJtnIFEx4eWsvu7JGLOm8sCOv9wHPn0lZlpKOxjm51Wh+d3YiTiB8ZQupyj9lC2C4WWxoco59dbEN9yTYN1ebYAnuXTKxPims2vdSqGUwMUB0ztlo33r7WHlwgKf9R71rU4Gsa7vJgbDcihud2Mve2kOceA1VDfrdkvYYijI7aWkrBsxFBA9P/QeGBLuaSnOpXhVOjzRwPExPCtfXL8I7KJn6P9t2TZTOZ3ChmIp3xQ==; s=purelymail3; d=purelymail.com; v=1; bh=Fc6IXWLwH5VrIIY4TpPhp1GmAfGDN5J90ztlIHB9e0c=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1578161:62319:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1341206260;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 07 Nov 2026 13:55:39 +0000 (UTC)
From: Younes Akhouayri <git@younes.io>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 7/8] rust: drm: Add JobQueue
Date: Sat, 7 Nov 2026 13:55:38 +0000
Message-ID: <kw-1794059738.215694434-299782-0@younes.io>
In-Reply-To: <20261106140752.520386-9-phasta@kernel.org>
References: <20261106140752.520386-2-phasta@kernel.org>
 <20261106140752.520386-9-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 15:07:52 +0100, Philipp Stanner wrote:
> +
> +            drop(jq); // Release lock.
> +            T::run_job(work.fctx, runnable_job);
> +            jq = work.inner.lock(); // Retake lock.
> +
> +            // run_job() above needs to be called without lock protection. Thus,
> +            // it is possible that the driver instructed completion right before
> +            // we could re-take the lock.
> +            if jq.last_completed >= seqno {
> +                *jq.as_mut().project().capacity += u64::from(job.cost);
> +                fence.signal(Ok(()));
> +
> +                // Drop here directly if possible. Otherwise, let the DropWorker
> +                // take care of it.
> +                if core::mem::needs_drop::<T::JobDataType>() {
> +                    jq.drop_list.push_back(job);
> +                }
> +            } else {
> +                jq.running_jobs.push_back(job);
> +            }

When the IRQ wins the race, `complete_jobs_up_to_seqno()` kicks the DropWorker before the job lands on `drop_list`, and this branch pushes it there without kicking again. Am I reading it right that the job then sits on `drop_list` until the next completion or until the queue drops? If so, is that acceptable, or does this path need a `check_start_drop_worker()` too?


> +        self.with_inner(|inner| {
> +            let mut inner = inner.lock();
> +            let drop_list = core::mem::take(&mut inner.drop_list);
> +            let waiting_jobs = core::mem::take(&mut inner.waiting_jobs);
> +            let mut running_jobs = core::mem::take(&mut inner.running_jobs);
> +
> +            while let Some(job) = running_jobs.pop_front() {
> +                let fence = job.fence.as_ref().expect("fence not present");
> +                fence.signal(Err(self.err));
> +            }
> +
> +            drop(inner);
> +            drop(drop_list);
> +            drop(waiting_jobs);
> +            drop(running_jobs);
> +        })

In the `while let Some(job) = running_jobs.pop_front()` loop, `job` goes out of scope at the end of each iteration, while `inner` is still locked. If `JobDataType` has a `Drop` impl, that ends up in `DriverFence::drop` -> `synchronize_rcu()`; so is sleeping there with the irq spinlock held intended, or should those jobs be collected and dropped after `drop(inner)` like `drop_list` and `waiting_jobs` are?

Regards,
Younes
