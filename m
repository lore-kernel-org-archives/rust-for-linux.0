Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC37F205ABB
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141760; cv=none; b=lGdjpzXNbduAQ6lzyL/+1zd5jzfGtVePYMwkOC+3quYP+dxAll8necKXUe68WcEka2fRRmJzdfh4iOwSon8nXiDLWw53QHh9u/rtkF9o3Bui6AhuZSltKFkJgEB7fAzCKS3be9Cs2aVJc+Rw4V2XvDxio3XZO3yeMimmpWfaeFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141760; c=relaxed/simple;
	bh=ISMRNILunmNVpQay2xuW+BwWkSsWt7wAKpZZeNFOcag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqvzTYns+yA9oAvO6+1263ngqJ660fIRtx2aK316iRZ2scYsmL8Y2y/5ntw66LMj4j+5ROTYeKBNKe2ahv0if2YSmgGDL/OT8dvILuh7nloFbSgwQxUrfXyoGrAFq6+HcGafdeVG2TDfeLRTC+ho7t2VF8ID5fXY/srHWXLI2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F1T+gGcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F1T+gGcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BF1C4CEE7;
	Thu,  5 Jun 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749141759;
	bh=ISMRNILunmNVpQay2xuW+BwWkSsWt7wAKpZZeNFOcag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1T+gGcHs5XzIIg5aimSR7HR6Z+yVcLzV+Sb9RD2auOcILZzJB9cykVNd1aWdAldi
	 jbGZwIje++MNBctWiLZeRrlJTxhO4Jzy8Cmzf5UoQ+jHZ15qH5gs6YTuMs8WkJlXdO
	 KmRKO4PZA/CDIq312gZz4IHVJBxai/XlC/LWqZ4g=
Date: Thu, 5 Jun 2025 18:42:36 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Message-ID: <2025060531-backless-venus-68f3@gregkh>
References: <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
 <2025060508-spool-twistable-66af@gregkh>
 <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
 <2025060511-surcharge-overfill-a721@gregkh>
 <CANiq72khbkdS625Bcb1iX1EbUwo1iQOLVoke698SUm9BA3PgYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72khbkdS625Bcb1iX1EbUwo1iQOLVoke698SUm9BA3PgYw@mail.gmail.com>

On Thu, Jun 05, 2025 at 05:38:56PM +0200, Miguel Ojeda wrote:
> On Thu, Jun 5, 2025 at 5:21 PM gregkh@linuxfoundation.org
> <gregkh@linuxfoundation.org> wrote:
> >
> > And I'm saying "don't use dbg!()" :)
> 
> You likely know all this, but in case it helps to clarify the
> discussion: `dbg!` is only meant for temporary code, i.e. so it
> shouldn't be used (in the sense of committing into Git).
> 
> That is, it is a development tool, unlike `pr_dbg!`.

Ah, I didn't realize this, so thanks.  The dbg!() implementation in the
kernel tree matches the userspace stuff, so the documentation refers to
"release builds" and the like.  It would be good if we could say
something like "Use ONLY for local debugging code, NEVER submit a patch
with this used in it."

Or we can add it to checkpatch to catch when people inevitably do submit
patches with it?  :)

thanks,

greg k-h
