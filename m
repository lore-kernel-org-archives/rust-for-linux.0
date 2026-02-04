Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2867357A34;
	Wed,  4 Feb 2026 05:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182661; cv=none; b=nlxh2mU9jS5PLKAUv61hcpuaq6DJxN/0UBve1z3Ibc7RaQveOsQSlESf8bB1vhIdcToGH5K8kYGGGyQZ4jkmflbdsowajmFCcS7po+a2Ua9HILYCqX4rgOsImrq3zpJ1wXcIbK1RYCeg801crcAr1DkdNlJMehrxKLgkjCyIDa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182661; c=relaxed/simple;
	bh=aqW9UVRImVZs0o8DkCRUnrCV4s/Fs3/TFLWbLvygTjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPF/lhlRyLJhlLlft6zq1Kk3+xIyRZJsMdpJLzvdtkOs4Ctw4Maaj+yR8D/nCfdHYtmEQbLLChztr+q18DohXTdvRl2UZnCUrM5/N22gdDRzbTh/FpS6eSYuFJ1sywDpQtrFiISJ80ax0BS/V5ni4moPq6R2O+x8ACQOGMZi7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V84Sdcep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V84Sdcep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47F4C4CEF7;
	Wed,  4 Feb 2026 05:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770182661;
	bh=aqW9UVRImVZs0o8DkCRUnrCV4s/Fs3/TFLWbLvygTjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V84SdceppgyD2JtSW7A+r1kwFPQ5ZWr3QIuq8o6pvL7Gp79f3F/Y3JlyExsvvV+cc
	 bMi6JBzevNzxCoDqtSPkiVxu6+7PNcd3L9PcWsLdXt9420Rjva8ObKq7QLsRFm+Mo3
	 khb+0oa7mUVo73MTprF+IEP/5Gqqui2wRY1/oDTA=
Date: Wed, 4 Feb 2026 06:24:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add work item runtime modification
 support
Message-ID: <2026020440-herbs-tranquil-d0a5@gregkh>
References: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>

On Tue, Feb 03, 2026 at 01:55:55PM -0800, Hamza Mahfooz wrote:
> This feature is required for our Hyper-V VMBus reimplementation effort.
> As it provides the ability to modify the running state of work items at
> runtime.

This is great, BUT we need to see the user of this new code at the same
time before adding it to the kernel tree.  Why not just submit this as
part of your patch series for the rust hyperv stuff?

thanks,

greg k-h
