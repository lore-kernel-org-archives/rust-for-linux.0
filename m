Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC1400DF0
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585361; cv=none; b=RQhsIVd837anWpu1siSX48SYgWxLk/dA2wGYczd70VgowuqpNMw4/9oOdIHvGNokUIAzMlLDE1SkE13gbc3P9R5iqXWFt430CfoDg3c8DljdJR5PqEBrNiNj8Ned5i0ME1XKmTtpgkHHxkhqK0hJU7rrxfaCQJv4dN7jnJnKME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585361; c=relaxed/simple;
	bh=p/E40OchiCIAATog4k9UI2wf5Njq1VLiZ0vJ6FEldh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3LmL5DX0ZnZ2b0CDsVwomB55sh206BRp/PcIYlkmtSuIdapEzZwgIz9Ypne7RqURIytLglKkCOFxdc/O85J/wqMIUGg+iGr7M0gtkFe15YVFX7f+nLYxzQCdKYmlU7fixr4ktWyI1Xg0/e3JXGu9IX+rvnJv8BZRUjUhoY/87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhbT0O3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhbT0O3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3A21F000E9;
	Mon, 20 Jul 2026 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784585360;
	bh=8Ftt5I1U+v7N8gDPdM4QJfqcIGHxY2jpsgfPlRmdXKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhbT0O3Jpm3R6QrVmhLVeemlrY9/XU8YwVo8vtOpWIm1IVstETEBIQZSURnMVb27N
	 W8fxPjHg5lk8sWzLOWXWi0mlhbZwLoNDeuyZAEYeAaFoAdITzBxJfLA3lQMeGto00G
	 rKhYx+9R70PippL1Zcb3s3ahYND46bs1kE2LDsiuI7ZCj7mW6gM9aPxr5GqdA5Qgyl
	 tTdKzrSAO4BQjFzN3xEAUz+LQwlkyRtedSjwB+M65AwonkwfD+87VrtOYKc91MfLHP
	 joiWwzds09eviYIKOmZOCTTzls3R+9O+9e0NsbpMrMuV6o0N7XeFVsxEYN0OOWKy1R
	 ZLK29e4UzIeTw==
Date: Mon, 20 Jul 2026 15:09:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, Alice Ryhl <alice@ryhl.io>
Subject: Re: LLVM 22 needs bindgen 0.72.1
Message-ID: <20260720220915.GA3368142@ax162>
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
 <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>

On Sun, Jul 19, 2026 at 02:17:57PM +0200, Miguel Ojeda wrote:
> I guess you used the instructions which pick the minimum `bindgen`.
> Maybe we could add a note there, or simply remove `--version` to
> suggest the latest (which could also be good so that more people test
> the latest).

I have updated the README to remove '--version' from the 'cargo install'
command to help avoid this. The warning seems like a good idea as well.

-- 
Cheers,
Nathan
