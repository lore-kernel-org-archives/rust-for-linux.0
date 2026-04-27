Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2235F19B
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 06:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270917; cv=none; b=aHuc0Kmy/S+mNpxjzV7Yj96dLV8akSCAJ9hUss4nNi5312u84ETOm3K82lmXGllsIxdBjPOw3y7OYX13trjpiQ/l1LyISWzqMR/UcZIEw0obqSsQfZR8Csx175FJlM21+J8/yror0cab1TSGcflwGDA7rObKT50uTZNQOHgldjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270917; c=relaxed/simple;
	bh=UgInxv6Vp3c8wEsJhnlb6r8MWS04O3YMMsBPiNfrSuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DPPbKnKJ75gy8k/LjQeWoEj6N2S9ik7rAZv2tY3fnMhtR14iHNBbMfkQ+qI/rQtQatFrSd4hw6FsO7MeHka8GBWwH8hK4+2Fp/OE5RTAKPavYBoNVajMSEO5pcJGqsoVVreEHgwl5FKKRbsl623m9Dt4/F0XWacjAHFlcIPC4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a8/QvMCO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z2hvE5VT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LQ2Kxq4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=56Q2Gyyf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a8/QvMCO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2hvE5VT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LQ2Kxq4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="56Q2Gyyf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFBA66A811;
	Mon, 27 Apr 2026 06:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777270914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cZEZt7TCHH+wwJ5U7se0n4LEFWnmTvWqAEh8+bNEVvM=;
	b=a8/QvMCOy7MnhkFVUqZe863NMkucjYHZ9gvSqNKuEPlgXBsZFdR1wT96zCdsH/GOHb0WzH
	ib+4/PiVdKigHQaE8q6VQ9rCb6bGi1DgEG1PGkFvIzWE0zPdJi8zb8EFzBfR7ZmwrdPkHl
	zCLIChQXa9QrjIc9HJ+j9d+nINHP+QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777270914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cZEZt7TCHH+wwJ5U7se0n4LEFWnmTvWqAEh8+bNEVvM=;
	b=z2hvE5VTBMcjZF2KCUfIYHtSKwguOElWB40l1aK7p2aU5s1kGex8bUB5rGEiOcZej+z4Ox
	wfSZ2O8RrkMhVzAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777270913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cZEZt7TCHH+wwJ5U7se0n4LEFWnmTvWqAEh8+bNEVvM=;
	b=LQ2Kxq4sLYgGLQhLgsB36cwQ6Eksn49DHpLx3gaGo6PcL/eGFJm2suAW3cbJwx8cKpPJEo
	hbcs6DQtNjgOVA9abLiXz4BOCBVfdrS/2KlFNu9u2rVF9MeQL8ZSbJiilPFtWz9cTJ1+bJ
	hHQUmMlVqk78xbbrbJ9AfcTVaTuWnLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777270913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cZEZt7TCHH+wwJ5U7se0n4LEFWnmTvWqAEh8+bNEVvM=;
	b=56Q2Gyyfb3KxTbEVd0y44GekdVLBzuCQ3zMFOwnetF1TJnH42OlBtO2PcOx3Yd3h6ReUwL
	vn658Zw12EdjQ7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 124F7593B0;
	Mon, 27 Apr 2026 06:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yLfkAYEA72lSFgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Apr 2026 06:21:53 +0000
Message-ID: <46b215b8-4b78-4a84-9474-ca5f852b2c95@suse.de>
Date: Mon, 27 Apr 2026 08:21:51 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/2] Rust DRM build fix
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dakr@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 daniel.almeida@collabora.com, lina+kernel@asahilina.net, j@jananu.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260426082234.2026908-1-mkchauras@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260426082234.2026908-1-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[kernel];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,google.com,garyguo.net,protonmail.com,umich.edu,collabora.com,asahilina.net,jananu.net,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.com:url]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi

Am 26.04.26 um 10:22 schrieb Mukesh Kumar Chaurasiya (IBM):
> rust drm gem shmem doesn't builds due to an import error of ARef from
> types instead of sync.
>
> This series fixes that and also makes CONFIG_RUST_DRM_GEM_SHMEM_HELPER
> dependent of RUST and making it selectable from menuconfig.

Memory managers are selected by drivers, not by users. You have to fix 
the driver rules instead.

Best regards
Thomas

>
> Mukesh Kumar Chaurasiya (IBM) (2):
>    rust/drm: import ARef from sync crate
>    drm: Make CONFIG_RUST_DRM_GEM_SHMEM_HELPER selectable from menuconfig
>
>   drivers/gpu/drm/Kconfig      | 4 ++--
>   rust/kernel/drm/gem/shmem.rs | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


