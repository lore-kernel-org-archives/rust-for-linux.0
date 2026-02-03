Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8642EFD9E;
	Tue,  3 Feb 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133791; cv=none; b=ugyq8juK9jOVV/rOxHdQ+ibox+3TNKZ3UEKf35fjOaeWOdzWrAg9eud5RD96hQ7R5FjV/LkWPQIuShsNSs+Gd/DhZN2L46O+wZPehIOYYom5AYvYeDc4lsnRVuDP+z2My63BN5y++packxeKEj5lOeilxu9oCJbYi70AZu4QawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133791; c=relaxed/simple;
	bh=Zkg3hklQPiFFGCiLL7OWIn5Yxens8gQsHhsWJBE7cC0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCG0Bik9HBx/MzAAOINf0Ifcz4T5aZrzNtAajOn0Lo0r7TtkMbPJHUcJINfKVvs2PAtHoYIyl8uwUYeNsFxxa7R8mbxvFHacVGCj0TSQkETFjtHf/rJhdvnhkzdyuyVdeOes5roJrJjKlBZOq9WQvPDHrNIm0Wjkwq/Vw8m3CkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=X3NgD4ev; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="X3NgD4ev"
Received: from mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:26c5:0:640:cf7d:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 1CA4082C58;
	Tue, 03 Feb 2026 18:49:39 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Znq49dEGxqM0-FgftWMGK;
	Tue, 03 Feb 2026 18:49:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770133778;
	bh=wt8XYlHEBYDo42xll3a0C+FtNAbV+n7osgglyKWTVYA=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=X3NgD4evwsn43K0ey0P4bT/Clhhu+973cNVRwkVE5KocNUpfzM2e/87WPvcSGIlri
	 i4OZU7ls22YCDpLI7yPA/+vgouDmMfzhXKhBeqKaLSpeapzjU1/d5efTmUlr7e5NPD
	 sC09SGWk+24PmXqLd1OtsyKyO4h9DYnbVv+xkhIg=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 3 Feb 2026 18:49:33 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Jkhall81 <jason.kei.hall@gmail.com>
Cc: dirk.behme@de.bosch.com, joe@perches.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
Message-ID: <20260203184933.23c92f8f@nimda>
In-Reply-To: <20260203152542.45017-1-jason.kei.hall@gmail.com>
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
	<20260203152542.45017-1-jason.kei.hall@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Feb 2026 08:25:41 -0700
Jkhall81 <jason.kei.hall@gmail.com> wrote:

> Nice, emails sent from gmail get automatically rejected.
> 
> So, Dirk.  To satisfy your concerns the current 10ish line
> code update is going to slowly, after many more emails
> written in nano, mutate into a franken-regex-perl beast. 
> checkpatch.pl is already huge.  I'm not a fan of this 
> approach.

Me neither. I wonder why we are doing this instead of using the
unwrap_used and expect_used linting rules from clippy. This would
catch the problem much earlier than checkpath since many of us build
the kernel with CLIPPY=1 flag.

Regards,
Onur

> 
> We could just not do this. Right now we are trying to
> get a warning if someone uses rust code that can cause a
> panic.  Software Engineers are smart people.  What if they
> just don't use rust code that causes panics inside core
> files.  Problem solved.
> 
> 

