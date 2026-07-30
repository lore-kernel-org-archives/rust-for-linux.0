Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55DF3E5A1E;
	Thu, 30 Jul 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404740; cv=none; b=KkGV9Pv1dJQtanMZjUPOMnjsmp7cwvUacqcxrmnwjSS7KMeO5/hVmjWemqI8Wd1m2PKyfrZUMOo0iLqwnfQ7csZvli2qt8AagjZEL1vYgTVLE7c7N3ez1cWq3qsEkpj8YIWFDYGrocZzoDYm7z8w1VKEyJEnwk9xTvQnn1kW8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404740; c=relaxed/simple;
	bh=cU30pKBIFPwKFVp+ZUCheTXWhKhVmJEBwgBrtWOhknY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLJQ9B9hLChbeQP9XxfT9KFttskImhFmc5YWpfZYIGfRnKTFQqTQH7jbfEe94LkgpPd4KtqOYHVK9PfP0W2sK9BmKiX9LPZ2JN8hZruZtoGPqeXMU5MH0j1DVNqMYUM1Zr/gzOgIHyD7x7KcE28DBWB3jTeL681e/to55cerc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AgBLBgea; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AgBLBgea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785404736;
	bh=cU30pKBIFPwKFVp+ZUCheTXWhKhVmJEBwgBrtWOhknY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgBLBgeayquUnuvO/gJyRJ5p8PXaTa4T5VwYdygqSWAQQ/FHsaFYCK+a9/sTOy3XW
	 +K5fiUgRW7W6+g3AQs/2CHazaZKqnZSosPe4Swl7Sw1cgyMBH1kIPWPD8Tmlj0XRQq
	 4ifBLERri1NqfzH3Dy+f+OD+y3xTPfCG3nQgG0gX5uqphHMGy9/W/ItM4cbdOr/XEJ
	 E6bVh2+hydiBbdMTVaz1DOnSIFW5WGue28hkblWgd1G3JxgK3WUae7qnVJF99p58nd
	 547ybIvK3bX/drIERdEZQ6QVCb/tyF+WrRR/Gsue6Z9wOXUsKaRjot9CL8vWm9nsWx
	 zwBACyxwKZpTQ==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E35AD17E0048;
	Thu, 30 Jul 2026 11:45:35 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: work@onurozkan.dev
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] drm/tyr: add Job IRQ handling
Date: Thu, 30 Jul 2026 11:45:25 +0200
Message-Id: <20260730094525.245487-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260729165121.768013-1-work@onurozkan.dev>
References: <20260729165121.768013-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Onur,

On 7/29/26 18:51, Onur Özkan wrote:
> On Wed, 29 Jul 2026 11:58:29 +0200
> Laura Nao <laura.nao@collabora.com> wrote:
>
>> +
>> +    fn handle(&self, status: u32) {
>> +        if JOB_IRQ_RAWSTAT::from_raw(status).glb() {
>> +            self.fw_ready.store(true, Ordering::Release);
>> +            self.job_irq_wait.wake_up_all();
>> +        }
>
> You enable both GLB and CSG above but only handle GLB, is this intentional? This
> means CSG will trigger the handler, do nothing and just get cleared, or am I
> missing something?
>

The series that will later add CSF interface support will likely only 
include a firmware readiness check at first, with CSG bit handling 
added at a later stage. That's why we're only handling the GLB bit for 
now, but I agree unmasking the CSG bits here is premature then. I can 
drop this in the next revision, keep only the GLB bit unmasking/handling 
and add a TODO comment for the CSG bits.

Thanks!

Laura

