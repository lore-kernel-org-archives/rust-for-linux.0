Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482AD3A8F7;
	Tue, 10 Feb 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735478; cv=none; b=ZghhjsGdQBi1lECm6wygcJ8TH4rVxEcdRFL2obhwk4qoSMqX2a1FwY1uTAO0plcRuGce609FkKYFL2880lxr4unuWTB7M0dgkbJDRJ8HvnCtrg9+mUHrzIqs5OibiKAlgNEIrigk5oUHSVyDgRgGIX7iKOgttASL0eq7J69nx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735478; c=relaxed/simple;
	bh=8fqNgMt4GEKsfnrjQVVwOS/ylSwIghuovg1fPQrBZHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtHgRmlOL/yPV/TsMUVId+YjEMuon8LrhOaepmQXT4n6JccXzs+hB/VyN69PfIjUo/pfSVJz37RW/4wY7ENv3lqelbxTndrQ4DyZTCMReiv7OEN/WH3kqUJopI8pXT9ThXmtMKivu+TK1BmvzQsZjeA6M74e7AYmLlj2CfJUGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kcJXaioD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kcJXaioD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770735475;
	bh=8fqNgMt4GEKsfnrjQVVwOS/ylSwIghuovg1fPQrBZHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kcJXaioDfCmRrGoBA4yLRF1rGkr7VcLOPZqqAKn5DOlnLn8nAgCGUp5zNqi2W8mqN
	 G3RF4gHiQVfbWuWB7710GMHrYbzpmwHpCKn7eXLDJnKcfHlWfEarilutNP1cTuxRzJ
	 lXK4E7cPAN8Vuux76JDQIZUNbGi0N+AkFToQQgVqVME52GQ37Y2x+nTzMqnnwdsC21
	 dq+9grSd4rDLYT6IyP1oooguVRB4y3sq+OccYfbv7tiWe5HA/4qiymg2UWnniZoYSi
	 984QIemsUm7QMwrau2zgVRrytOdSzvJuLbTYBgGB7BX9jiCTHADYdkHurJUAMeI6Nr
	 SpL7UYQYZEn3g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 083D417E1305;
	Tue, 10 Feb 2026 15:57:54 +0100 (CET)
Date: Tue, 10 Feb 2026 15:57:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260210155750.5cdbe6cc@fedora>
In-Reply-To: <20260203081403.68733-5-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-5-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Feb 2026 09:14:02 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> +/// A jobqueue Job.
> +///
> +/// You can stuff your data in it. The job will be borrowed back to your driver
> +/// once the time has come to run it.
> +///
> +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ownership transfer).
> +/// You can set multiple [`DmaFence`] as dependencies for a job. It will only
> +/// get run once all dependency fences have been signaled.
> +///
> +/// Jobs cost credits. Jobs will only be run if there are is enough capacity in
> +/// the jobqueue for the job's credits. It is legal to specify jobs costing 0
> +/// credits, effectively disabling that mechanism.
> +#[pin_data]
> +pub struct Job<T: 'static + Send> {
> +    cost: u32,
> +    #[pin]
> +    pub data: T,
> +    done_fence: Option<ARef<DmaFence<i32>>>,
> +    hardware_fence: Option<ARef<DmaFence<i32>>>,
> +    nr_of_deps: AtomicU32,
> +    dependencies: List<Dependency>,

Given how tricky Lists are in rust, I'd recommend going for an XArray,
like we have on the C side. There's a bit of overhead when the job only
has a few deps, but I think simplicity beats memory-usage-optimizations
in that case (especially since the overhead exists and is accepted in
C).

> +}
> +
