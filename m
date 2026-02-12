Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBA17D2
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858367; cv=none; b=CHk6a9yOO8uoDdR5314Cex+qaBCLN1PjwFGRYYakUuvEKIG5yVnJhuJZqpUyO4YqH/c5QrD8uvGjHqcWpLZKFFDmFYhSRY50vmiBcMo8fHyF3JnIFQ0zSV2gJj7Z594VJGEuCei/0RrVPBlVMtOQQIpgYBdY8GB6uw3Nt7mQDr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858367; c=relaxed/simple;
	bh=FLB/HwVzI4G28RdFxk7UsL/yMNmCmNuhgTgVvaLx6Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z1vHU43TNIjYnj6+kNO2RDkIR42zr3n5zEwHYPz8vdM8xJ5GFM2fjX25KoXChe3qNLZznfJMd4+IMxpbGgKs/PbaNgqEj6PrKbMFIIXNvUpJuRtzBeZXR3eHqe/7DpTkI512l2GcFYi7TBkVJDsSB1LXoI44/3E+04xj49ew4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 12 Feb 2026 10:05:56 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.47)
	by 156.147.1.151 with ESMTP; 12 Feb 2026 10:05:56 +0900
X-Original-SENDERIP: 10.159.44.47
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: gregkh@linuxfoundation.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se
Subject: Re: [PATCH v4 1/3] binder: fix PID namespace collision for freeze operation
Date: Thu, 12 Feb 2026 10:05:56 +0900
Message-Id: <20260212010556.3691-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026021121-guiding-finalize-0c4a@gregkh>
References: <2026021121-guiding-finalize-0c4a@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Feb 11 2026 at 12:13:38 +0100, Greg KH wrote:
> On Wed, Feb 11, 2026 at 07:17:37PM +0900, jongan.kim@lge.com wrote:
> > On Fri, Feb 06 2026 at 17:53:34PM +0900, jongan.kim@lge.com wrote:
> 
> <snip>
> 
> > Dear Alice and Android Driver Maintainers,
> > 
> > I would appreciate it if you could review patch v4.
> 
> It has been less than 1 week since you sent this, and we are in the
> middle of the merge window when nothing can be accepted at all until
> after -rc1 is out.
> 
> Please relax, there is no rush here.  If you wish to help out, please
> help in reviewing other patches that have been submitted for review, as
> that will allow your changes to go up the stack.
> 
> thanks,
> 
> greg k-h
> 

Thank you for the guidance.
I understand and will wait for feedback.

Thnks for your time.

Best regards,
Jong An Kim

