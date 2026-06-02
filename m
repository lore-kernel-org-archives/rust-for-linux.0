Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C06357CE6
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397784; cv=pass; b=bQFEF7HpWH4N7HWdS3zfXTL+fwLX7XTDZAHMOAbIw8trenLec89nkAvXztvjpze5+VUxXaTTWtObDqJxQc+NzuNXfYVNmpxtcJQQ3VD08BtR5krpz/W+9YX7fSg9CZ8yoU/mdKys9AN2khSh/ImNV30FvCQ37jDonRgdH04FXU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397784; c=relaxed/simple;
	bh=qpJ7DIYnveN38OIokGL7dJTIBiQVvD5eg6M0Ese/EOQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LjCBQ8a4HPHPQPYPh8/T4eoDTTKOR/V9x6XJEung+Cn6SNDlx9/NnYH3VJqDTPM+0UW7FXD+GyXMPWzY0Cg3tIUWBHEVe4qs/g9SWDZa5TGB4ssq4pPVWihJyEvRZzDQqpUo9O7qOFF2OYAKAm/2E8KvJXM9RBJB234Anvx4z0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YUUzW8UD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YUUzW8UD"
ARC-Seal: i=1; a=rsa-sha256; t=1780397771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=im9nJq32cMf/AaxOxw7ddKE2oAtPjIbuXXkQpZQIdgGGixPBBslhvCjQx3udsv+RcDEyidaE2+17AVkqzIpIEpkKlM9+dIqzFDi8GS3LH6sd9jgTP6ZaI0yRtkqkQ9NJl8BFhFebUXy7jvGU+PNyAOIP/0s3aOHI5xIJhZXiEj4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780397771; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iiBqjoD4EsYqN1Fal3BhE3EeXjYiDrKSSSa/8jY4Bko=; 
	b=LGfetZ4eXbSXt35OSAULZH1+55ZJvj5MvYjnwFx6g2LMJCzhYhn+pZlVEn54/SJYezbPt28ndPAxT8+4NkozqcLqdLbvXN81+dbwGSTpqw2LVC/DbPtQCrzC+Qp6ULwA+pckr+nFR+1uZrM2I68JLFFtmSDH2ILS7ttxQHM0O7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780397771;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=iiBqjoD4EsYqN1Fal3BhE3EeXjYiDrKSSSa/8jY4Bko=;
	b=YUUzW8UDzKIpQy4JqBRBbq5zO5hi8klUbS4R6CTmYQk8S0/vRAd7dhA/EjYSt8KV
	qYCWpQdzfBnyngNV0ewDghksfysVyQPjm2IQmQDgCnlirloQLZeg6p4krD/ArrZ0RGZ
	D6PCx4RtKqVy4C3yvArUu1GSk0u6O9nnNpE+sLQw=
Received: by mx.zohomail.com with SMTPS id 1780397764062323.93913048628724;
	Tue, 2 Jun 2026 03:56:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/2] drm: tyr: use lifetime-bound IoMem
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260529000106.2257996-1-dakr@kernel.org>
Date: Tue, 2 Jun 2026 07:55:27 -0300
Cc: aliceryhl@google.com,
 boris.brezillon@collabora.com,
 deborah.brouwer@collabora.com,
 gary@garyguo.net,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <17A1BFA7-A5E1-430B-A954-9C2AC9439FE3@collabora.com>
References: <20260529000106.2257996-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 28 May 2026, at 21:00, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> Adopt the driver core lifetime infrastructure for tyr.
> 
> Separate the driver type from the driver data and use lifetime-bound
> IoMem directly in probe instead of wrapping it in Devres and Arc,
> simplifying register access.
> 
> Changes in v2:
>  - Don't return Result from GpuInfo::new()
>  - Use "drm/tyr:" commit message prefix
> 
> Danilo Krummrich (2):
>  drm/tyr: separate driver type from driver data
>  drm/tyr: use IoMem directly instead of Devres
> 
> drivers/gpu/drm/tyr/driver.rs | 29 ++++++++++++-----------------
> drivers/gpu/drm/tyr/gpu.rs    | 17 +++++------------
> drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
> 3 files changed, 19 insertions(+), 31 deletions(-)
> 
> 
> base-commit: a3e50e7279996cd987001fd8a3db36e72665f8f7
> -- 
> 2.54.0
> 


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
