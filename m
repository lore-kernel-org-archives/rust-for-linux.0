Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876341;
	b=5ZjFXcHIa0S0fHqasJ+Cgf47kHc3zCvDJcN0UB036tw1WBs0hDCb26+i5ZFLAAy6XyL9
	 eFj+zJM6XIskUf6pmTmDfyYpHXzvwnyQlXJLD1gsSf3YIK9CR5MW0WRiXn+A4JnzizjCt
	 zsAfrRqxeXGxxCDVRWBXbgIcugZbmflW5Vqf4V66hbpyo2CW4ScH8SOCKfxFL4k2l4nx+
	 hh/ztg/jQdWMiv97+n8eVMZ4zNsJm8d4zBVxycPeKnsmPZmc1Zmjo039IE2p4U0nnMaEI
	 HDN8+slasyyGqTzn2IA98GVWL69DSAvciitJcVYPVT5dVhE/+Jt+qtHzjC+fYrlPCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876341;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=;
	b=BD4K1AjwqjVViwOBGe9vr3uKSvMn3HvwxXBAdcmNROuNWJjS9iYASCCGJNwFUTkG0dUR
	 eU9dSzzNM6cE0Y9rrOmgofwPgBRp5y6Yx6egwSAgwBS+QFSWnm/TMpTE+q55hMKsNj4Md
	 TcRovRJ5xyAeCBnf0bSTbPFmO26oHWAIgl6twk7HrybckQIPaGQ0UroYdXxc+nSQKyHNe
	 z+3hh1u500UqLqYLEF5U1+eSzEdXK0UWzWj1RZzNVzsYxbSo8O+YuBmQL4R8JGMuFl+2C
	 s0qtp/6YgSjy+3WMIiaJNYRuiVNiaT9GB0VOFFk09UKiS0CZSEpawUBSLRT5ei+WccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=TsLNq0Lo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Phvz6Dnl;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F86606A329
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 00:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F86606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=TsLNq0Lo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Phvz6Dnl
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BF9CF14000B6
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 19:45:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 16 Nov 2026 19:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794876339;
	 x=1794962739; bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=; b=
	TsLNq0LoX4UQg0NpUArkzXQlNSsxL/n/DjBBqbMG2SfKAT8b8zWkxMGgdhMxeBZ9
	wxMgn/Imme0HJvNDpF2j0vjz+ZIbNdjuppwjLOZ7nXY+o6X6dtvCz/yt07Rs4/5C
	Ywk1Lu5Qhw7voiy1XapfUuPw9lVZ5fXmigr7GYMZx+XGx5I+l6pFur2IB1h7ynND
	Z0p5FCO0pBoaV/Jk5RxGyi2SssHi9yT3pLzr5VtPHVoz0E8audOC4G+ThsjFzgyE
	6nFmR7YHzQ2xJOON79v0ch3Pl7sGkUWXuJNoMHEeIvtCjakACLCWGA605P8w0lXq
	kBejgaTWKUZpm3ODgXNGFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794876339; x=
	1794962739; bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=; b=P
	hvz6DnlTNT4xwlj556S6/OXVAtFwvb4B+hwD9IRBv3ClqKlj9bkP3oFRjayD+2mZ
	HpHTGJSVSXHw1mtUbmUZDTtnQoKICaKJD8HDDM5nSuhDLbMT0Wrvfecgjt8lN+YM
	qLMtUxuSD9YxdZJRzO+eBnrmzxlm48iIknFvWYXlI1GP+nZc8Sln4hT2tOIote2a
	7B+yYdeGDAX8DQwy6TGQsZxuxc73JwheEY4PBTDRB+UJlGjWujPMAfXtAH3n42FG
	g+fp4Mg7QDa+acXIo+PCyTc0Hvc7m7V4MpV47r+F8uQVON/uk7HWnsZRXFMvcnmb
	C1wkv6gDTzfWESmlPcTrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794876339; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:dTT8MfbP5wyzNSWJIL08Jj1OInSho3RnzsEVGjM0QwyQFtI
	94FJ31lohOoBYZ35RtCRDIawC/8fIV+wSGzJSDybPpqt07U6uGnF8ylyDC6BJLDh
	8edGDvGEQggYAyPfyD5vENCqmq/fZ2ieafR3E68+yNY2yJ/pORbZAHIrbW4F3E2t
	iAMpDcZnJUEj+wGzJ3+1CDR2eLCT9uMVUR6E1Faed4Fv3PxPxHOfchTVbUFhyeFk
	sz2zBjYNG8f6gSwRAUpglCgY8mJJLEDJnx+2SO87dSWoz5yxO9zesKPam2LaQQOZ
	gKdZAIIjXMb8jqaFCb/l51IfFwdiF0hL7P+HoWw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7za6rRETpovpKoK81OR4LXJBJIIOFqxRjHIFDeKgWuo=:l49fCnoDEnr1DQepJzhk82iFjB6bWpZ6iLNAqwE+8Ss=;
X-ME-Sender: <xms:sqP7akNoF_ROp--fKRzAPJNaEsUb0FVRkJFtncQEVmV4eE_u_ANqqw>
    <xme:sqP7apWA2oCYAhUTkV5Xy3u_BiFLKYsFiM9pnWOtcvA5buGODqZb4inZ__1_Pk05V
    1jjDxe-vPiVeDLRVHJVAbAh-wMfj_kBQJQt-dKvSrQxrJQBXoUG4Q>
X-ME-Received: <xmr:sqP7anRWVmctN-8o2J9bDTCJ4cwsOfeVqlFIz1173KLpKNgkRdBoo8uRfnA0wLB3jzG10fer6s7NKsDW6olpoOyW>
X-ME-Proxy-Cause: dmFkZTGpddrMU7DTWO1z0Z0br/CEgkbIJ+wswoDJLOHKcDXXjyf4X69Pe40ttRK9xz69Ui
    OtVoNeVbHBsW5Yof96cJKL5HFmafp8G5qN0putY9Wr1rxmdKLaPrxZM4rPYhOFHVTlnkpV
    kPiDuJrSDvom+0/HD20kP6B48wuykA5LSL+38rh7KjEOSYqi8bYb/bOzVSjnvMcdxtHAFW
    vsPKzmW0VBTiVHz7ytsRmcdEetrAXcMssxPwpZ23TLLMyQnWCe/RX088SSb7nrXWDAic6v
    FVlObIIAUIEP8fYsgUxcWcQP48XilhmsEOYmaZsl7c/Rsl69KcUDe7f2Cd08nxWZnZ0LGn
    03UchNTJFowDd8HX8eCCSknjoYaA2LUZ9O+/QDfMadzwcDkYE5e8+Mhhkk26qG/p5Zz0rX
    DlII/+75TbRKnsmy6WeU5nl/nIg4oZdcX2d3dUJaenCBpBDWSy/q6mEhc6W1K/zapFC0Px
    xnrM5mF4j/SpHRyowHG+6t6kQhltllqsuiTXlH8u5XipV/cpRF/hThkS0wfQtIEXRWkyVj
    MtXueI+EYrq/o6M9eWF920hniWht5QwgNyp8vOyJZvB9r8YdVy4T/E3OKEzP06J259VoQW
    DZolk+Qd2Cz2kDgJwR97dyGSBpnbU2GhodrGhsQ2lVLG3Tuw8jPELg+pqSmQ
X-ME-Proxy: <xmx:sqP7av2dupyxDfBRGPQy35A5Fms-2OMF5uNxUsDGXNH_UPcS7I0Njw>
    <xmx:s6P7aki0bHq8YVBeCLIieZ8NKYVG5z3j2QV72Kb2uv9Fygeyqum69A>
    <xmx:s6P7atYmsDbapO0YsZmo9kgnc9QJbWs4qoxVrV2K1q_xLuGPqekk6w>
    <xmx:s6P7atPa5mu5reVur2exjN0kDZjYYZEtRnvVZ6AvEKzazJYHbH7Eyg>
    <xmx:s6P7akEDAMElziy0fUfALS_u_vNLfmL95VOFvm4OL6hIsV_WredPDX3D>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 19:45:34 -0500 (EST)
Date: Tue, 17 Nov 2026 09:45:31 +0900 (JST)
Message-Id: <20261117.094531.2139684707820199268.tomo@flapping.org>
To: dakr@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, aliceryhl@google.com,
 lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org,
 acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] rust: task: add safe schedule_timeout() wrapper
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261117001507.1611984-2-dakr@kernel.org>
References: <20261117001507.1611984-1-dakr@kernel.org>
	<20261117001507.1611984-2-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 01:14:42 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> +pub fn schedule_timeout(timeout: Delta<Jiffy>) -> Delta<Jiffy> {
> +    let timeout = timeout.as_jiffies().max(0);

In earlier reviews of my patches, Gary asked me to use the function
syntax or clamp() for this instead of the method syntax [1][2]:

    let timeout = isize::max(timeout.as_jiffies(), 0);

[1] https://lore.kernel.org/rust-for-linux/DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.net/
[2] https://lore.kernel.org/rust-for-linux/DLUDG2TH77RI.ZQ0T5MH7Q573@garyguo.net/
