Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E29338910;
	Wed,  4 Feb 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223643; cv=none; b=LFztyoYCFCdI2+9YwU9IYL3VWwWY4EziSkxTKNVU1d37dhgAG3K3eHMLrgtETyeCOxwhxX3PJEIGMbkMEb2er99UlRhvtod1TnBjsJ2PZQlKSE0dmHjsoZ/RryzanIaAXm3n1CoiPDgjs4gaonFnmv6HCxOTNEhDhQLfE4FAyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223643; c=relaxed/simple;
	bh=dZi5zbISUaPpdOjD3mQysirbe0qI35CATtWjGq/MdDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKZz9nKQ47ODHbO999lihsGFAi4gD0CiKn49+rACMmvy6XCGkOMlLmpPFLA5S7zvjg6msBg8CfbV+xA+Tte7dCsMbLwC0MgyUYRyPbhU5JWA4vDvd2w/PGvSLt49FNK6rLbg5x1I4V12VlMYZWQRGBd/0ZRv7D9WfrwkELefsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YjAi/G54; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7TvO6NL6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YjAi/G54";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7TvO6NL6"
Date: Wed, 4 Feb 2026 17:47:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770223635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NNsV874Ht9gBigLKrZ7cMSwSHKZYBxzSEwX2eW4xZY0=;
	b=YjAi/G54xY6oQePWOyTdpCLMZSGf1ODJfLE1i1lJYJGFV4246ti++ifseySlybOrFpvuVF
	gr9kEylZuO+2VfryTBDqTs99sxhkzN4TYLu54I0KikE7J8dhzeYTZAoNVjwpcdG9ivrl7S
	rW0tdx+3+eJ0jcz1X0BejiJFCaXPzWiIdsNLOgcmGmsanoI7sMxpFVvRPCUmBU0mmPbpP4
	mxGcvPSLy6f6M3IK/6gmMb5A2aszFb5mOhtHcIttC+fz0+rVLVktXB5gjFOvf6fG4iiDfA
	zTSiJI4Q+xT3kqLJrsOjXkzf1vr3+UVnq3UgJuiM6Va2RQeC/BY3N1NrMfRZAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770223635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NNsV874Ht9gBigLKrZ7cMSwSHKZYBxzSEwX2eW4xZY0=;
	b=7TvO6NL6uluQamW5aaEDezLOwdI+SqqwlTfLM/NUlhUS4KwvJ8v+0y+N6twgq069JvIj2z
	VtkHRuNjzn0akpAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add system_default() around the new
 system_dfl_wq
Message-ID: <20260204164713.omijmiTB@linutronix.de>
References: <20260204155037.325482-1-marco.crivellari@suse.com>
 <20260204155037.325482-2-marco.crivellari@suse.com>
 <aYNxkG3gCspeeW9_@google.com>
 <CAAofZF5GZ9UBLNH_+NRSyXW1114d++TfEc3EuBiCpPkdwK1pUw@mail.gmail.com>
 <CAH5fLgjwz_WmkWDJrZ1d_HZ228-whdgQkMb4WnmKu+g3ktEskw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAH5fLgjwz_WmkWDJrZ1d_HZ228-whdgQkMb4WnmKu+g3ktEskw@mail.gmail.com>

On 2026-02-04 17:38:54 [+0100], Alice Ryhl wrote:
> I think the ideal would be to rename it to default in C too. :)

| $ git grep system_dfl_wq next-20260204  | wc -l
| 115

> Alice

Sebastian
