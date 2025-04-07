Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9E14A4C6
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024680; cv=none; b=kVOZJSysVz4Ec3EtvXY5df87pLKkUWIBkWyHaC3/vCPR1pfnVurXx7lA7J2MsxSzIXY/05UBA9a/x4NBtOUZLRtB0iG/A3FDy3a9yki1SacTFPgow/WFidh41DyP0XD+y/a+u8AKDk1sGs6GRNDOlN0webFFPd0+h+mGDTcD3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024680; c=relaxed/simple;
	bh=fqGG2shGnSKhb+dYOAxcAae/QMZPrk/xD8ikjkjdlVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFxuadT+YXRZkvPJNv78TAVJrZvCjS3nO/gXGd1XxJi1aB8izqpf87bbtQPbZa9uf5BdWhKHZvxFWkKqZW2BkApI0OSrZRdam9JJhlN5WWIZaT4XJM3PaOS/JQIgBkx7F5h7m91NBNUbSiCtZ0jKFlhOKaYS7H6eEgowPztawMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VgMapjay; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QDVY9++H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XUk4X2Y6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AjKRQdTH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VgMapjay";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QDVY9++H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XUk4X2Y6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AjKRQdTH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F2C261F38D;
	Mon,  7 Apr 2025 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744024677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwrEguwEyFbqWOdegyCfPEX+HK28mD3Cgo6l2mUTnM4=;
	b=VgMapjayIL6vLNo7Ryd66t05Av82vFGrVtvupuOIkBgA3abJkMLN7kCWeez+dWwSXY5RNH
	txEtnyK1S5A5FsGjUlHtv3D1Rc8v1yK1xoreJXb0PDnBeNxXSg/bUEVQVB0SA+hj+453/E
	HAEiYs+mnGt+FNfVOZr2Koo9ZNJu0Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744024677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwrEguwEyFbqWOdegyCfPEX+HK28mD3Cgo6l2mUTnM4=;
	b=QDVY9++HSYzzKzaYZs9lQtuSbdgfv9Op7aly80GZCuKg84lUGYRHu+SVWNCx+KqC4OVZvP
	wGhpvG5RC2px43Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744024676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwrEguwEyFbqWOdegyCfPEX+HK28mD3Cgo6l2mUTnM4=;
	b=XUk4X2Y6K1r5gxFbStBvzVFDsRwS/C7ssrfWQU2ysjHC1c1ZsXhsDUR72vRfUlUTy75Sd0
	MBmcGstMZycsChrH6k8hadClwH5OOo7f7A+a/hklWUJK0hjMLfHR6VGwhPhUEHC9qBbkJ4
	7/TyclSvYflhJT5TZcDhu/GFooLBQL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744024676;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwrEguwEyFbqWOdegyCfPEX+HK28mD3Cgo6l2mUTnM4=;
	b=AjKRQdTHwhkmlK5EIjPV0k31pr1sSKAq9u7FKUPFj9sn5oKUTerlno43O4Us+hiYPwni7x
	/4tOQ9ylghNEg+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D817613A4B;
	Mon,  7 Apr 2025 11:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aDRWMmS082e1ZwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 07 Apr 2025 11:17:56 +0000
Date: Mon, 7 Apr 2025 13:17:56 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <nmi@metaspace.dk>, Daniel Wagner <wagi@kernel.org>, 
	Boqun Feng <abstractionfbq@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: ABI stability and Rust
Message-ID: <6c087691-471e-473b-8490-932a7ed341eb@flourine.local>
References: <87iknmv1xs.fsf@metaspace.dk>
 <CANiq72=20SyjyPCZ7maPMGc-vK1KPgX6iTjntPs+JKqVHqZhDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=20SyjyPCZ7maPMGc-vK1KPgX6iTjntPs+JKqVHqZhDA@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[metaspace.dk,kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi,

On Wed, Apr 02, 2025 at 09:00:02PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 2, 2025 at 8:44 PM Andreas Hindborg <nmi@metaspace.dk> wrote:
> >
> > a) Ship a blessed toolchain for each kernel image you ship. Users
> >    building out-of-tree modules must use this toolchain.
> 
> Indeed, this is the way at the moment.
> 
> > b) If users cannot use the blessed toolchain, they must link all rust
> >    code into their module and ensure no rust symbols in vmlinux are called.
> 
> We currently don't support this. We could perhaps support it after
> some other planned build system changes land, but I wouldn't recommend
> planning anything based on it at the moment.
> 
> > Outside of those options, I don't think there are any other solutions. I
> > would not hedge my bets on rustc getting ABI stability, ever.
> 
> There are some related efforts, like crABI, but yeah, I wouldn't
> recommend assuming it will ever happen. If it does, and even if we can
> use it for the kernel, it would be a long-term thing.

Thanks for the feedback.

For the background: I showed Andreas what we discussed internally what
is missing regarding enabling Rust in our downstream kernels. Besides
the livepatching feature, the question was how deal with the ABI
overtime.

I am not really involved in this topic so far. But I am sure it will
help to move things forward.

Thanks
Daniel
