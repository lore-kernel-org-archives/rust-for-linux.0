Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B71C862A;
	Sun, 16 Mar 2025 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742148092; cv=none; b=nL3wc/azGAQ4fCQbFLhIMFmjLf/d1kGqw8oEZs6P7r+fGCCSWuA/9ecUEyi685EUpKRTPJV/4FuYS+huaMj4p4y22SCPPy2tvU5o5910gi0CbxEYb1ZTYFDCkMY2M3SDUbYCDm3+KlvYwbH+lCe445DtuQImvmNhPP+1NhKTiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742148092; c=relaxed/simple;
	bh=QXR00CS8QUxl5UcLkdVT8Wo7n+Glksoub62YlpafMVE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EM6zEvtS+z3CJ4w3uw4rJI1JyAgXc8GZyzhUzrNT2vuF+kUucUw7g45j2gX2VlahZzwwQNR2nhUKtO05nw/1NaYoRpP1LgRosj6XrkLXiP5yf4RitUlEdWcihvujpNL+hhTqTZ2oJYOgsAr4xtnjl/kbY7noIbVE/rgMq2niZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=br+hPYt9; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="br+hPYt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742148087; x=1742407287;
	bh=tAOyqqzV3U1doRz6F+tF1ZAeoLpn6CDfC6jWDliUrEo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=br+hPYt9Gnwa7o6IBCW88llVLpCKrhm1GWAa2kho4+eWWTBZS+6S+ubbKlEWppETU
	 RAw9A5p1vS8w3QiwmwAkDMufLI12hL6tdt3JVJNO4c9T/OskCpr/dealfBc7Vf7w7Z
	 AcMQpB3mxJRdx7/zzZ6AyphoU3rvhuaUAZ5zgM2f3Oaueb4+JimxwN0mIOpMtcOhfN
	 dip7LuZI88MW7P4jIdzFCMmtLWD2Um/0oIXMwQEDrAETEIdXnI+zKCoxt+Vvini2Mq
	 +VhEZC/9B8C5JHR+jk2qxrJaZEWcCff2YaPaqVJna4WLKcsVlefSZJ4UOcvuhKerlX
	 uiiFEnDxfCqcg==
Date: Sun, 16 Mar 2025 18:01:21 +0000
To: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
Message-ID: <D8HVY5KSXNRL.YPQRJFX9R8XQ@proton.me>
In-Reply-To: <20250316111644.154602-3-andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com> <20250316111644.154602-3-andrewjballance@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6851ab4816f7ad4e9864ac4c422a20a36671b293
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 12:16 PM CET, Andrew Ballance wrote:
> implement the equivalent of the rust std's Vec::resize
> on the kernel's Vec type.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

