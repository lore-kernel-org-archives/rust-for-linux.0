Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350C37D104
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117686; cv=none; b=EeDaCLP31PD+kwHbKDitJKFwNQm6wrn4tYu537x6FAkb7SWp/vQOeHJMysx7YnqX5NAxrDsF8Gkf2Hzd43VU9cWAkmMRc2oe8jyW9O5MDPyayayrTgryi4AR/xu4yEWjv5XP1nhI9UGNreG4SVUfXNPMo5vpxxr3QXCrt3SP3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117686; c=relaxed/simple;
	bh=Ze2NWM9t6BzojOpRtlgWdqStZabOs9WJTc/eEI2xyY8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7f/kpaLd6BPe459dFOAMex4ND7NNCI9lUUJD4dUahmA4MfbdCDEyIZxcKDnvjOz/iAvmcordZBGHSMhzYF1aaSys40i1m9q0WchSrA0KcMer/UXJuLcxAU08ddG1Jp3OaMyi+aI39U8ANxhp7g1kLmSopkQVNXUfHi07/iUg1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnBF6H4/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnBF6H4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769117677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ze2NWM9t6BzojOpRtlgWdqStZabOs9WJTc/eEI2xyY8=;
	b=RnBF6H4/gUwjdptrwNskRP0Ao+j6LQnsk7lPQEdZ1Gqj9I+75Lk7Pun0/3HIlvZm47t6d6
	t9lTknF5Z6zRu0T6zxT8eMUVtIglBPKBu2Jwm9P/uEMbcq5GfqWV/8JAirw/3rEjV34Oi0
	x9gGMmCUD5DxhNVuzAaOfPAWDp/hDLE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-11PTubtYN2yPPYYV-K71nw-1; Thu, 22 Jan 2026 16:34:36 -0500
X-MC-Unique: 11PTubtYN2yPPYYV-K71nw-1
X-Mimecast-MFC-AGG-ID: 11PTubtYN2yPPYYV-K71nw_1769117675
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so39770926d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 13:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117675; x=1769722475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze2NWM9t6BzojOpRtlgWdqStZabOs9WJTc/eEI2xyY8=;
        b=Hz8MqS2RAUBeUrnw9oC6anEWVWuEQ4q4y9jQvotzeNw1Zfi3ueHF1yI1NbZLNGfcaR
         d1R/iKki6uY29YK390L6HZI8ZfyazKjwib70uyQ3VGmaz/iViqmKHi3qgbr2hMFFMP4V
         TnU0oBm7Qq1TPyajgJJbExviBusadrUVmneG7xSa4OOL/xQDx2pguCm0DvZSM5SjdpZZ
         ypy9DGksIkL/SpFyfT8XwznyNGaW3Y4fUccy6RF1K8TC3bmw3y/saKF0vDg6Z2G39LOc
         wqGxIsoJq+AOrhwAabq06etdWQ7unCL1AXl9A3eohSTr9S+q5ct1v2S2ifpmFg84fvL3
         lcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoo5Jjk+Drk1khU2N8ZpYgNKc+DTkZ2RTSN1N6VrFh7i43+6grFZ2EsLrjiDs0z2naWSFiusN7ViIMrhcVfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVBBtnCaoQrc6n7J09Y+vdi5KIskdrIAtB5FeYM05IptCPDtU
	PInl60TN8FgLCiewW1sxEAIj4bBUSER2FkerA3Rgqbr5e3RA3zDNx82ls++vtHeLKe9OtGZTsqg
	hqDQJTWpr2JJqGGPRmWUGZ0l1yxaxoHp3yxzrwz6h73CBeI+ECah+iUBNCWJt3ZNMqcAp
X-Gm-Gg: AZuq6aJ9nKa8zzXlQYo6SSHcAEJt3SmkoQpVd8jEmAfOyJyU6rtYUxGgWJC2ctZ0A17
	ssk61P9uCVZEQh42Xp1NdzQ1vJxYBtRpaQATXkeN/mosAh7QId+ai/MAa9Ha8aHNxBPZGaeYQSH
	xP4hQwr51mI/tiKJvO2rn/abPu9f+8QRlMIfq5rMuxcjvMfsXl7lHog2ahOmT6YstRE5qk4RRMk
	48QtZUbJARIyI9nmarKKG3Pu+5qUIrWggH2IYrnF4TdZqL0rIhharsZElFFGOlHvwvWaDRRE+bH
	1KbFZ0XJhE09WemmXEqWcLpN/VfBv0AMPXpMGaABXbK2NpXF+kIQii/bR/w8AlKdz3YV0Of//+o
	LJq9K/Q==
X-Received: by 2002:a05:6214:19c8:b0:892:66bb:fdbb with SMTP id 6a1803df08f44-894904b5044mr12928076d6.23.1769117675653;
        Thu, 22 Jan 2026 13:34:35 -0800 (PST)
X-Received: by 2002:a05:6214:19c8:b0:892:66bb:fdbb with SMTP id 6a1803df08f44-894904b5044mr12927756d6.23.1769117675299;
        Thu, 22 Jan 2026 13:34:35 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491824d47sm2941886d6.7.2026.01.22.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 13:34:34 -0800 (PST)
Message-ID: <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Asahi
 Lina	 <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 22 Jan 2026 16:34:32 -0500
In-Reply-To: <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
References: <20260122202804.3209265-1-lyude@redhat.com>
	 <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _D4jwEfu5bdJBvYfraHAK0y_6lknfmQDniMEi16XS3k_1769117675
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-22 at 21:30 +0100, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 9:28 PM CET, Lyude Paul wrote:
> > This is to match
> > =C2=A0 https://docs.kernel.org/rust/coding-guidelines.html#imports
> >=20
> > There should be no functional changes in this patch.
>=20
> Thanks! While at it, can you please drop imports that are in prelude
> and use
> prelude instead?

Just a random musing - it would actually be quite nice if we could have
some sort of automated style check for this. I have to assume the linux
kernel probably isn't the only project out there with its own prelude=E2=80=
=A6

