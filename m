Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DF023D7DE;
	Mon, 29 Dec 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766991438; cv=none; b=UaW5sKz4zoIuZKiSua/qGuYWchV7DEB8pyjaRiPtriqDkull2sb8B9KhoO5GY/WiOZs2bECM3MzF8igSiqR4Kh22FRnFh8fCA30FrkTlW26esZa+XR+L76LPd+W+DJ37s3lbLAa7XDzvYOL71i02JYmo/gN7ADrkU4F1517B7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766991438; c=relaxed/simple;
	bh=3Xlk7G6bmd4X6/lYVrx7q/DEebj24CCDZyGomhzFc3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVGbZE9vTdIMuq0ogmVSwHslAjiBqcGEkQNMWENUydqqcgSEWTkOmUOOjwwPvzRcvYNUATGV47/LTdfYfn7CdxRO8GQH2sYikP7JqLQ5CuzNUz/TrW43+cf4TWQOnGe+fPyN58cw8WaXLlAy9vTaQLOmoxwvD6QPJMqltAp6CDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jjuNxnsu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jjuNxnsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FCFC4CEF7;
	Mon, 29 Dec 2025 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766991437;
	bh=3Xlk7G6bmd4X6/lYVrx7q/DEebj24CCDZyGomhzFc3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjuNxnsuIaZoDMxK0gnNTqBRqhRzHQs3pO5xZLJlgwtYrJ0npzKBGxQiX1LiHLPn0
	 dUWQLA9mZXqVCnv11S0bVF8V6OjDaswaFLEhRFQcqmBqCklJo/EcCGPyooHL62DDN6
	 I1OjCMacDI4O59mVBVfje/lGFtKnzKnwLbdvUR+Y=
Date: Mon, 29 Dec 2025 07:57:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ban ZuoXiang <bbaa@bbaa.fun>
Cc: aliceryhl@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] soft lockup in kswapd0 caused by Rust binder
Message-ID: <2025122947-award-effects-b765@gregkh>
References: <20251228183129.17193-1-bbaa@bbaa.fun>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228183129.17193-1-bbaa@bbaa.fun>

On Mon, Dec 29, 2025 at 02:31:24AM +0800, Ban ZuoXiang wrote:
> It appears that there exists a patch addressing this issue: 
> 'rust: binder: stop spinning in shrinker' [4] 
> 
> I have tested this patch, and it appears to resolve the soft lockup
> issue. 
> 
> Could this patch be picked up to fix the regression?

It is in my queue to pick up, hopefully this week.

thanks,

greg k-h
