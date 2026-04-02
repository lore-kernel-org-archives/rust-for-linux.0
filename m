Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6F31A567
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112000; cv=none; b=EFextl4xhZNk3W9wcYWp1CluIcI75JieTHE8p0mb1+duBacnnyFKXH8f5po1f4OoUEgmB6hfqDIPOm20GPMa57h0x+RhtG26WtT3f+BqQ3wBU9K1kWKQMzak++qMvbE+VQylj0U09tjlhMDO7w9K8BAnditlCOTl4w/wDZqM88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112000; c=relaxed/simple;
	bh=F92uNx124eo6CuTR2SkIUKUgI7gi65kPAs8402itiy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Loqvx2Hd/sWZOtMWO/i7P2K1jY04Sya9cH+tSig2HimDaQwg74v8vFLIhHKjZ72BlKSTyOG3s2DAGyIE5uX4CMPr8Napwc+cNPwhOJigDw/9XS0aMP7o0z2DWUjMpVOtlgS3Zp1fxbY3v9P1GYKullMceqwtN6g6rsftbfes33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCS0O1Kp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCS0O1Kp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so459600a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 23:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775111997; x=1775716797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6T2dQvI1mSEP2cZOOFDJ0349CayIDKQeIFznfl4/Jk=;
        b=qCS0O1KpJNMHd/67VjtW6zIlIkt6j/FcRnNKozor30Hs5OsLBYei+NkqMaeKXL2b14
         MqnuwNmfk4J8F8Y+kIB/8O2P8P/oD3E/xZ7larUvAa7yFN2NfYJdby/gQ8eQ8QGedt2+
         wUPrSWT5tVXqMAjNaAmwkLfkEFyhOoA5hAk+n3NWRnSrpdBydw96FpsZG37Z07DqfZGq
         Ivno4areOQoimLO8bJa2LL3L+iIFUMR7V15aWpjOPoUsQGmqQkhqkJVOX7pi+zywv/Iu
         lrjo7eEXB6vf++201TxqcwkBhQpdBd23AYLiXstQcZu2KJRhN9JFN6XXK7QLxrmCHsaR
         9vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111997; x=1775716797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6T2dQvI1mSEP2cZOOFDJ0349CayIDKQeIFznfl4/Jk=;
        b=Hucg+oN54QlO4sKAqN7XLn05fpUSwGC//FDOoubpJAC+N1N3pUXQcBl/Q6DCsCvcI6
         laEsjQ4wZKHcDLdtx5jn5rHRFtH5Bx53mcKAXDP1UiXQgQqsoHNiwp3vkW8xepHeHkNp
         zRa98EYPm+vH6sXE2nROffUcwBkCF5bQeNbYMamIbSmHkA+u1y3WK8e/lSODY4oueXMQ
         K9nYXfemGSymh/WKdWw295cOPu32nxFErwxyZCx8QCEtzBk1HrkkWPHgJSo6oqm2kBHB
         6LWQ1e0ZRMkWfdhjTuABMES96uxeQRuSuQ8sRx3jLscwyu6pnNnaqqUm6Lf1MP6TBUmk
         PfCg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5fPhBPb8HsV7AcnT62SgJU2mr2kn7nNU0Mx9QeHQCxqRRcJENHC0EQ/zja9M1Sx7oWilmY692IIX8IcwKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7kaDzOln/fosJAY1PpyjqWuoz9bDC3sk740LbxcFwK3IAM6m
	2Y/BT6jka/Ld6B0y6epcp3M+LAZ2wKjJaRgvrcMB6Aqcf+UDGkPZIU6uS47RM5UL3lGTf4cHAlY
	eVfxk
X-Gm-Gg: AeBDiet1RxCMRpBvYST6sWB71CStFQDIs7qZfDcEKqil/Pz3DHNHoZT67nTPY7Jqlsy
	uyenNDyYYzIduT9FhM/snAdoU8MQC5zqmXTKjI8srKOfnIVZOTi/tL4swhxcxllPLiztEodNjtw
	PtqGGhX08nJBXsNWmjkLQJkUmliPUrKZWuBbpy80CKmbLmE0C8/VSnIWRVrjeOya2Z1drv2jxjS
	HsgG7pFl+3ZQHPc0rINBoxiW6Pa/PTH/8/FCDPqzFmj+RvU7rr7zm/1TtyrluiWztW5aeGDHVf+
	P7ZjdPTiw4D6KYmuGk4pGgrpoH3HDX97zD/mky9Unas4MPm7KRm+9sjVH6/B6sCD5XWSbYHd39W
	pI89Z1XxmBEHy5Td3Nb1HUkAnuLI1mDu01DUywiXXwSEiPQYgznCWrFY2uatwCzite1qPCgNEXT
	1VwMQGGqgOcxcH9gMFTyDHZE7O
X-Received: by 2002:a17:90b:4c8e:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35dc6f6a323mr5986457a91.19.1775111997319;
        Wed, 01 Apr 2026 23:39:57 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba54797dsm3316950a91.1.2026.04.01.23.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:39:56 -0700 (PDT)
Date: Thu, 2 Apr 2026 12:09:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Huang Rui <ray.huang@amd.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Perry Yuan <perry.yuan@amd.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v4 1/2] cpufreq/amd-pstate: Pass the policy to
 amd_pstate_update()
Message-ID: <4bwfgnjiywkm4dyslhzmk6lvar3a6rhvtcyyruc7okybckuwuf@mkdc5dlconx4>
References: <20260316081849.19368-1-kprateek.nayak@amd.com>
 <20260316081849.19368-2-kprateek.nayak@amd.com>
 <hin33mzxwjjycw7oonq4klqmgmgavqpoe7r2ml6qalytxfpntk@me7d6q6yiec7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hin33mzxwjjycw7oonq4klqmgmgavqpoe7r2ml6qalytxfpntk@me7d6q6yiec7>

On 02-04-26, 12:07, Viresh Kumar wrote:
> On 16-03-26, 08:18, K Prateek Nayak wrote:
> > All callers of amd_pstate_update() already have a reference to the
> > cpufreq_policy object.
> > 
> > Pass the entire policy object and grab the cpudata using
> > "policy->driver_data" instead of passing the cpudata and unnecessarily
> > grabbing another read-side reference to the cpufreq policy object when
> > it is already available in the caller.
> > 
> > No functional changes intended.
> > 
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > ---
> > changelog v3..v4:
> > 
> > o No changes.
> > ---
> >  drivers/cpufreq/amd-pstate.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Oops, I already Acked it once :)

It is ready for Rafael to pick now.

-- 
viresh
