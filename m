Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCEE224FD
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025019; cv=none; b=GdfCQp26L2DdPalivHPR12BHx1wbD+Z36ziWzu+4gmavAVobnE2LjNvt+KHLSgGmadgzPCk/lMvu+kr8pVFBfaxoHV8B44VitBt+kymfnhy3/B2Ie0cvO4dVWePcKIHSeoMUHNnC4AYUAUrbHMb+Fe7w/svF1ldOmTz1OaE+lAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025019; c=relaxed/simple;
	bh=tBUaJnMVGygV/YpzgM8rEGLbHtR2Y2Efn5jSf/+JONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQPH6DEYmtIlHK/A3eoIi1N1Ci3hraU/vrr47zjXM67IDHrd3WGJNiOH1ZkDLzdspuh9OZEtF+3n42LB0NCs53mJi4zYryVNH0oobe++DrUa485zo3gE4v64y53T6+/Muf0Ae9h8uoOuYhCu117/yQxaZb1N/CW0xDoksi5NR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=adG2xlwZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WqaZn2vW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=adG2xlwZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WqaZn2vW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="adG2xlwZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WqaZn2vW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="adG2xlwZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WqaZn2vW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25EEC1F393;
	Mon,  7 Apr 2025 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744025016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hvNKq9oFa+Zfz/FuQ/NiDRHKFku0aYwVPAmFtmu+3qA=;
	b=adG2xlwZCoa4dx72w+Xq3k2h629cJbMIA9IIkd47BAKcwihVZLdVptM30ehWaiPZOdoZxY
	vceOSMnwW1Voawfm0a7w3ZqMbTUvq0dEdmQ6PvHEg8EpmygKFXOs0CFB18jyFo+tTSvthw
	B9djmfi/KT0Quv/Q1S1zG9V7AOLgYTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744025016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hvNKq9oFa+Zfz/FuQ/NiDRHKFku0aYwVPAmFtmu+3qA=;
	b=WqaZn2vW/sCfv6iRz+JXnEw6vttF61MrIJnhrK+20ZdZta2kucxQJAB4NQDuPzVSdyonmP
	dv8f7s+5Kt1qGYDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=adG2xlwZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WqaZn2vW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744025016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hvNKq9oFa+Zfz/FuQ/NiDRHKFku0aYwVPAmFtmu+3qA=;
	b=adG2xlwZCoa4dx72w+Xq3k2h629cJbMIA9IIkd47BAKcwihVZLdVptM30ehWaiPZOdoZxY
	vceOSMnwW1Voawfm0a7w3ZqMbTUvq0dEdmQ6PvHEg8EpmygKFXOs0CFB18jyFo+tTSvthw
	B9djmfi/KT0Quv/Q1S1zG9V7AOLgYTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744025016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hvNKq9oFa+Zfz/FuQ/NiDRHKFku0aYwVPAmFtmu+3qA=;
	b=WqaZn2vW/sCfv6iRz+JXnEw6vttF61MrIJnhrK+20ZdZta2kucxQJAB4NQDuPzVSdyonmP
	dv8f7s+5Kt1qGYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B84C13A4B;
	Mon,  7 Apr 2025 11:23:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id reIMAbi182fjaQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 07 Apr 2025 11:23:36 +0000
Date: Mon, 7 Apr 2025 13:23:35 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andreas Hindborg <nmi@metaspace.dk>, Daniel Wagner <wagi@kernel.org>, 
	Boqun Feng <abstractionfbq@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: ABI stability and Rust
Message-ID: <46532c14-6881-4aa0-9422-508e8319c2a0@flourine.local>
References: <87iknmv1xs.fsf@metaspace.dk>
 <2025040256-immature-winking-c062@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025040256-immature-winking-c062@gregkh>
X-Rspamd-Queue-Id: 25EEC1F393
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[metaspace.dk,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 02, 2025 at 08:12:45PM +0100, Greg KH wrote:
> So if anyone really cares about this, put the work into the compiler
> side, it's not a kernel issue.

Yes, this is understood.

> > a) Ship a blessed toolchain for each kernel image you ship. Users
> >    building out-of-tree modules must use this toolchain.
> 
> That's what the enterprise distros, and Android, does today, why is this
> not a valid option for them to continue to do?

I asked Andreas how to deal with external modules which are written in
Rust. What are the requirements, etc. Just a stupid question from
my side.

> > b) If users cannot use the blessed toolchain, they must link all rust
> >    code into their module and ensure no rust symbols in vmlinux are called.
> 
> They are not guaranteed compaibility if they change their C compiler
> either, so why would Rust be any different?

Got it. It's the same problem today exists with C.

> > Outside of those options, I don't think there are any other solutions. I
> > would not hedge my bets on rustc getting ABI stability, ever.
> 
> Then just stick with the same toolchain for the lifetime of the release
> they wish to keep stable.  Not anything that we need to worry about,
> this is on the external users to care about if they want something crazy
> like this.

Okay.
