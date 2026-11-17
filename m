Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925016;
	b=A62X+XAcs36jNz+WtDjS40/mlLkARIPgrG85rQ69NG5VVfc98wSKPGuMhh+lgLigIaVA
	 IukQavPtL3UE0/xqt+/XNa1l3LCKmVfN53yLJyGvW3vbjinNhJdTG4BR8W8JSq6dAgg9j
	 1qPonFVzFacirNhjPynTLy/Rzb0XCuOl0pqRMcZ0iQw6QqOitvai0OvoTAGd6pNXlUUm/
	 G1JJMhVYoUqMWkcGIHYVcKpPdZWohRa036mdvap4f2s3MFuaEZd28/+QrUxqTo8y3Zr34
	 wXWfbS+iQf0L2PQoj2k680NDQiSNvLnTgrZXv8kw00RmW4mMhEBfFH2HTAn/h1sN5lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
	b=kLP7JmgFg0kf4pVCS8tzS6rDS/+fZk0z4Ea4Tz7VnGivjNqdLViQ+aKLTDVuCNV01jSd
	 Sr4Lmaui+wujqoX5W6aMXDWSXpIDC8aBwQNv/g79PU+d7lUl5hJefgpI2Pnu7ItRrdJ37
	 sodU49LChoSW7T1MVSbiX6XBz/1LpgKFYCGJ2owgxfL2nZhqUTMDiFTqCLgJtQQ+XWl+I
	 2G4XnWurLIFpAQVjP6ysBARO8T+Vsj6qRbwVNLi1WeJ3rLLs8WZC976wIbjj0Vv/kSkz8
	 c19eUUripGhisXgShQxvkSrTn0G6HsIFN6vLG/KYJlu0XfPOeeBXFAHAVTgM3/0DyQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2tGsW40;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B70606A8AA
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B70606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2tGsW40
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49953abe51fso30232865e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925014; x=1795529814; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
        b=n2tGsW40NbEk5VZiWp6AE3NfHFtiBWa9FaDOLprd6PlkqVKHirPu6IOQsnC9euLMCz
         OdlnymHlKSg0jyaHkfhjRH6yLI1TDvkSFUL88fYP4zmU0h9sR987iDFCf41mQeWcH2Th
         mU7fTlEbLN4BALGxKDkmuEoR5UmOErhmhovs8nExws7GOCnWA7fY7spOySUyjFcBsBmp
         vTgUKdXyYKT0qNHGq7flMwxMRrC71fRecIMjRreqcBuMQGXLUjuyihIul95Cxrs905SI
         Mj9vzoSJSBZxauFx2NmGXymPAOXSgv/hKdOzPEq6zjTBiCZxbvczUtTqcITwfaBFu1Ju
         SayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925014; x=1795529814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
        b=gqb/he0q0fRz73aOyEUTTFWWIY2eA2neM3gzKHmxd3kdWu9ZB5w7V0S1cdHnWh48Bn
         nM4ZuldWD+zXrVD2kEzwcXm8bF4vEpvsePiwP/S7jdvGdgVZQCoWsHOg1KzWGyp33vo/
         M7zhJd56AtbhwMKc/q73AgCKqnYYVuVHww2gz862EMev/MfpwilpZuigbFIpWo4z+KjG
         LvgFa4tRScTUVsLdGopqMF4/ol7PRh+aoLvtW0XCa9ZHlw+w55QW4msu2mN8Bt1o2+kw
         mNXWt87bp7WvjZ8FQVtqJ5nJASie4/dpr01irGuO7JJlMAWgLsKZTMXc+GG2txjwkmYt
         UTCA==
X-Forwarded-Encrypted: i=1; AL+hErHZaJ+Abq3wrMviIlL5/+OizP3U9qnPqWqj/0rWIK24HiHonYsOXThIbjQKoXYOD9LPjAkTkyoYlF1wwnAjTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lz7J81qtcf/Y5g77jeS4AVTQGsqGnrpyZ4BsPSu9SDCmS2Oe6
	rbpO857k4GpTlYKrl9GVndWbwTihGI8Ghn4EHAl36K0yP3Y6iYioqUn+Q9J//MCF3KodwyP1SZe
	Bp4e7Bb84KiesrWhmuA==
X-Received: from wman14.prod.google.com ([2002:a05:600c:6c4e:b0:4a1:f979:6ce2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr284486225e9.15.1794925013551;
 Tue, 17 Nov 2026 06:16:53 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:52 +0000
In-Reply-To: <20261117001507.1611984-5-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141652.2992350-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 4/5] rust: sync: condvar: use task::schedule_timeout()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:45AM +0100, Danilo Krummrich wrote:
> @@ -122,7 +121,11 @@ fn wait_internal<T: ?Sized, B: Backend>(
>      /// [`CondVar::notify_one`] or [`CondVar::notify_all`]. Note that it may also wake up
>      /// spuriously.
>      pub fn wait<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T, B>) {
> -        self.wait_internal(TASK_UNINTERRUPTIBLE, guard, MAX_SCHEDULE_TIMEOUT);
> +        self.wait_internal(
> +            TASK_UNINTERRUPTIBLE,
> +            guard,
> +            Delta::from_jiffies(task::MAX_SCHEDULE_TIMEOUT),
> +        );
>      }

Now that `CondVar` uses `task::schedule_timeout()`, all remaining uses of
`task::MAX_SCHEDULE_TIMEOUT` wrap it in `Delta::from_jiffies(...)`, so we
could also change `MAX_SCHEDULE_TIMEOUT` itself to `Delta<Jiffy>` (either
if you spin a v4 or as a follow-up). Either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
