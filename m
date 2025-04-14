Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54454918
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643301; cv=none; b=fxwVojQTFd9yd3FBJfTMDKctQ1njopcFFG30JFZ490OCzjRvjn45Xwjfew/HbKjF2hfDoeiD4ziCKypHpPDGF+Tmr++Qw7Ppx36gQhZNtf/vgTM6XNDYS+/G1+BweZfZlB9nXwxMU0scdFU+3vRqos+YITTSpbSfe500syNFfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643301; c=relaxed/simple;
	bh=EP1a+mFT0AoW7ZDg2e9CZW885LClV02RJUGxL92jcpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okR1EZtVf3J53Y2UHR9646kc5CbtOSBR45T8B8GAtS8+7RtAltuYzyWTpLHyygvhGQcuWdp6CfQ/FBTcrBlwwo6lTGRHLlx+3i7B1I4SL03SjMHY6Ac4p+1d3ls8bCaMt6KjmMDJE/4yEazK0jO3YgBmRprsvq3uVFV3Gq1CQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=mkZodFU4; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="mkZodFU4"
Date: Mon, 14 Apr 2025 11:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744643297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/fGSQF8X4Yx4QtdO/Fiac3nc1UqHnECCOYIQJlj5Bs=;
	b=mkZodFU4E/w9hCrtxjyDOtUSb2/t9Zx8pJoFWEU/pr4XMRUftwmym2S6KeSyaPISojoaav
	ubDcpb63lkYDrhN/z1VUWHJTItJE9mtKFiCfnhhdbEhabPz//dgggvkMOCDI8/jx/Pvsr/
	gmk80UvJ+AVzOHXUZww8iPoI+88O5yyJhd8kb3/cf7n9nLslH7826YCnywrHToyd+gRuyk
	/gRYKIqKFZq338KrrCtgWAAEZ3sC92F5WZ2WfS6OIKM9mqvplRJuIiSp2mLk+IR53vphnl
	pLBR1phxJY61Kcl8aKGic8hJxtw1af43eFP6AhryXctM5P5OxSSh7sk1jcobWw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 8/8] MAINTAINERS: add DRM Rust source files to DRM
 DRIVERS
Message-ID: <Z_0k25z6XZDNKzQC@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-9-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410235546.43736-9-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Fri , Apr 11, 2025 at 01:55:27AM +0200, Danilo Krummrich a écrit :
> Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..a975fa8d262f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7798,6 +7798,7 @@ F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/
> +F:	rust/kernel/drm/
>  F:	include/drm/
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -7814,6 +7815,7 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> +F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> -- 
> 2.49.0
> 
