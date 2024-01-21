Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0141E49E
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Jan 2024 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705873866; cv=none; b=jpElRQahwHBrQ+4vxrE7fr8195OpnzsSkvPKDBW4iol640BPXsE2th009ANrrZxF0MoI2fBOluNtKD/4DYzocUaoJcWwDRh75pG2SvOhc70MtvBsTg+ccRYMCMmQZVmD7Rm/6xt42sJN6C/prbCnpJh9FY1oNUO4U/edPDgOnNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705873866; c=relaxed/simple;
	bh=e8/eHH/8Os+EruXNQHe/MytsP1WSv6RIhsXffvwgFmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZqqoxi+D70YonOiXI4vGpRlS+bg+FM4BRH0JVKt5GGhd99ncgHYSLVc+kD8YzDxE6NkldJv5ylnbOon46+tdy3iCY4CweiguJ3qQ1AN8dLc9aYTWWTM+20BJBNLhsckIc6qC3UiAhQGKKBvKJ+/4xX15+0/IjO7JzwwhcR4JFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=XNuJOwDc; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="XNuJOwDc"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7baa8da5692so104856439f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Jan 2024 13:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1705873863; x=1706478663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIAOAmfmOn6HuODB3CsU29FgEopZmi1NGSSNaqzbpY0=;
        b=XNuJOwDczQ+00LEoGo1VOwPkujnMOyy8J+aBrw4CLWRc5BscwtgrclzGIBVJy3RyBZ
         6pquohWu7HYrdtmVCbOeDKYo0oIyICHm8OQtX+uVvcNQcZdqR7KP3Dcf7xJkBTFbD4TP
         Nobr4od1FUfKNQDPqP0KN7WW6mnsQcz9xUGe7vSkZxBMOVLZ/Ly8QWQq+5DrbvC2Qa2x
         i9utPHjPCpJrT2hD5gdMI1LhJyIL4/mo2v3UIf4aYFRhC+MqRj1BrnZFgBSd84H9O/kg
         acgUOVJOtd4FoVS0qVmMSqoReuiSCvWgunztkCF561xLYi5cHVF41H5O+ZA2Kt/vfO8V
         DP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705873863; x=1706478663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIAOAmfmOn6HuODB3CsU29FgEopZmi1NGSSNaqzbpY0=;
        b=bj6PPjlKMt1LKt83hY43eaiQu7ug+kb4xhOaqBiNTXjjevHnQmMDqlHEiXU3WZ064i
         8Y1DaYqb1Xi9JESviDsRZq3AHvAYXjsDKtYCuDKd2OIECMoYCnfrbn/H3LpZ4hpW5jBP
         genpuA2R16rixvgY3LUdjsY04DNQbrK43iHv3rW5NsAt8bkfFL65RSJ9TcHu07ALBkM7
         fc99awspNecoQR+j6usVDLuxFo2RIWA1HZxozSKIN1Rzj2KUTniYddXjwW/Jgz1FELlN
         Dg25SfSCn8wvhQ47IXNZ4S22uNFOIKYhebwcg4TtAfS9OuP5AzevjGxnD9NJdDmX4yGw
         XbFw==
X-Gm-Message-State: AOJu0Yxoi6V/Iuo8VGXwfGtzlnY2FXyqVIGBiIdozCJdnlPNpd34aNgk
	HzePTRmgL4HNA8hAXEun29aQO2absLcvpDAWUJLtA2zg02d11tXLk5bA6agts1Q=
X-Google-Smtp-Source: AGHT+IHQ6ry5vTW5x85A9d0dL7gYg/4lpV5q3/dH1PwN74lOagyItZ0zxUAVZk4ytaOcxGHrMcmOcQ==
X-Received: by 2002:a5d:9b15:0:b0:7be:e36f:c84c with SMTP id y21-20020a5d9b15000000b007bee36fc84cmr3172078ion.6.1705873863167;
        Sun, 21 Jan 2024 13:51:03 -0800 (PST)
Received: from dread.disaster.area (pa49-180-249-6.pa.nsw.optusnet.com.au. [49.180.249.6])
        by smtp.gmail.com with ESMTPSA id u8-20020a170903124800b001d60a70809bsm6144359plh.168.2024.01.21.13.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 13:51:02 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rRfiW-00DV9k-0I;
	Mon, 22 Jan 2024 08:51:00 +1100
Date: Mon, 22 Jan 2024 08:51:00 +1100
From: Dave Chinner <david@fromorbit.com>
To: Askar Safin <safinaskar@zohomail.com>
Cc: wedsonaf@gmail.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	kent.overstreet@gmail.com, linux-fsdevel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, viro@zeniv.linux.org.uk,
	walmeida@microsoft.com, willy@infradead.org
Subject: Re: [RFC PATCH 07/19] rust: fs: introduce `FileSystem::read_dir`
Message-ID: <Za2RxF7iGOkI4A0e@dread.disaster.area>
References: <20231018122518.128049-8-wedsonaf@gmail.com>
 <20240121210049.3747-1-safinaskar@zohomail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121210049.3747-1-safinaskar@zohomail.com>

On Mon, Jan 22, 2024 at 12:00:49AM +0300, Askar Safin wrote:
> Wedson Almeida Filho:
> > +    /// White-out type.
> > +    Wht = bindings::DT_WHT,
> 
> As well as I understand, filesystems supposed not to return
> DT_WHT from readdir to user space. But I'm not sure. Please,
> do expirement! Create whiteout on ext4 and see what readdir
> will return. As well as I understand, it will return DT_CHR.

DT_WHT is defined in /usr/include/dirent.h, so it is actually
present in the userspace support for readdir. If the kernel returns
DT_WHT to userspace, applications should know what it is.

However, filesystems like ext4 and btrfs don't have DT_WHT on disk
and few userspace applications support it. Way back when overlay
required whiteout support to be added, the magical char device
representation was invented for filesystems without DT_WHT and that
was exposed to userspace.

We're kind of stuck with it now, though there is nothign stopping
filesysetms from returning DT_WHT to userspace instead of DT_CHR and
requiring userspace to stat the inode to look at the major/minor
numbers to determine if the dirent is a whiteout or not.  Indeed, it
would be more optimal for overlay if filesystems returned DT_WHT
instead of DT_CHR for whiteouts.

Put simply: DT_WHT is part of the readdir kernel and userspace API
and therefore should be present in the Rust interfaces.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
