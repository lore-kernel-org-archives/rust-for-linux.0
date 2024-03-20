Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B56BFB6
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Mar 2024 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710958679; cv=none; b=OGKAqr5vsSQCW70z/3CiEctbJ0N1lkEjWFCkkja6WFNvrJ+EFNP8rZcg3or4iIIGUS3aVNDm9S9C+8fVMaBrcgGt6yKILiBLtEo/u7WBWpf9+rIW3xrHBlF8kuqHorLdTspObichPA9ZAM+8zJ5HQD6AigYFhlh4EPJgQ6CwoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710958679; c=relaxed/simple;
	bh=nyR0uFG7tZpDXAGVoxwRgN9QFStj44cGzi46W0+gxB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxEmmHt2Jhn9MetrU0XwTbbROuMLDIuh9tLnRpd9lUmrNCK2aQ4FG1SbFMaQ6vADY5MiQ6EM2nxJvoUBimxHtS01Nu/2sJTlZgqT0f/kEoQE3h7oTP2OrANF54anjS3N3KDbPyGs6fd4n5n8Q6q7X/B/GP+medBRcUre+TTbeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RhiThRyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RhiThRyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D5EC433F1;
	Wed, 20 Mar 2024 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710958678;
	bh=nyR0uFG7tZpDXAGVoxwRgN9QFStj44cGzi46W0+gxB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhiThRyq/MN/RH0CbLM/1cZMJ/aCX1F3SuKOSRLETFEqW3rmgrMAL0pyYZkcMLvG9
	 45aqUG120Z6iQxUwUQ+a2n8I6Md45CQGLToscbOc5t9X/EebufPOLWsfQm4SaG8wUA
	 TnJSpCIt0m00Amai+vANkYZixDCvxcf4k6CRZoww=
Date: Wed, 20 Mar 2024 19:17:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, airlied@redhat.com,
	lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com,
	mcanal@igalia.com, lina@asahilina.net, a.hindborg@samsung.com
Subject: Re: Nova and staging Rust abstractions
Message-ID: <2024032007-imprison-rejoicing-e925@gregkh>
References: <Zfsj0_tb-0-tNrJy@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zfsj0_tb-0-tNrJy@cassiopeiae>

On Wed, Mar 20, 2024 at 06:58:43PM +0100, Danilo Krummrich wrote:
> @Greg, can you please have a first quick look at rust-device [5]?

If they are sent as patches to review, yes, I can get to them as part of
my normal patch review cycle.  Otherwise I have no cyeles to dig through
random github trees...

thanks,

greg k-h
