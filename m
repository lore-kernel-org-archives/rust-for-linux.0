Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29F47F79F
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064286; cv=none; b=fOWyOjf8XoSgmOZ0Sfqmzaqx8aubznaaBzHQlBeIekjEvPXdhoxAj7IShn0yVaBeWVPsfvMgcj5sJ/ZAPbsmhLiuZrXcR/zRbWpsw//Rz7F5lGdR/N2VkthM0S8M5avdF/ePjLLZXV9V/gwzazU9aN2q3ayCDekqSJGug+QM1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064286; c=relaxed/simple;
	bh=P1Ju42wncREo5Vp9rNxX0xn2aA1SFYVS45zju6dND0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqp3JSbcZga0xrFcIKlTvLi2HaaDYo1kt3JTYl2YsZBob8Dy6wef3R+QSRk9/wD6vEmeZtBKWqNLjHrqUQfqOu++Cm31iqjoKapUhREINoaftz49wy/hA/HdX4UMq/Fs7Ekt+e6KoCNgRZg8OFmIwETj+THzD9Bqd6qvQZnuGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=jZd0s7rS; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="jZd0s7rS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792064265; x=1792323465;
	bh=JG9rkkqaQf+1Do4XRnXjxaZtmMGMxUiV+NtJTaH6nS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jZd0s7rSSmoQbIBywI35uax7XhunB67m1eKuOvFptu+enJQmrTBZD3Gyy3dc5f1BG
	 GoeFwdgnzsyMkVwNFUy2BlJDsziQ3p+X0zk2wnsKoAOLmrUevLx1uy6JfEDx+5l6pB
	 ndiaTYO/bqUxBxU4JJq/WosUPt8qayJUNUzdSu930nS3yUI1FEXWBnKU2Vnng9D6Zz
	 MIGkFAMj2xG9yoJq+xKaT48qszQoDPhbqxoP55V0P5YFTacaRZur36qx7eMBDlA6K7
	 QA9Hjqmsuo1uXamgRM/1eyVyld6wkhfJZ2okGXj0MPjOGjaC30Wzn1lqrD7WF/h6tf
	 ljK9yq6vXuLuw==
X-Pm-Submission-Id: 4j55fF6rCMz1DDXY
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/6] ww_mutex: add ww_class field unconditionally
Date: Thu, 15 Oct 2026 14:37:15 +0300
Message-ID: <20261015113740.77088-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DM2TZIO2QALS.2H1R3AV8CBCVE@garyguo.net>
References: <cover.1791799751.git.work@onurozkan.dev> <168394bb52a6c68b0b760fe00413c899ab95f8e3.1791799752.git.work@onurozkan.dev> <DM2TZIO2QALS.2H1R3AV8CBCVE@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 12:42:31 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:=0D
> > Removes DEBUG_WW_MUTEXES guard around the ww_class field=0D
> > in struct ww_mutex and struct ww_acquire_ctx to always=0D
> > initialize it.=0D
> >=0D
> > Keeping the class pointer available unconditionally allows=0D
> > Rust abstractions to keep from_raw() simple on Mutex and=0D
> > AcquireCtx and validate Mutex and AcquireCtx class pairing=0D
> > in much simpler way.=0D
> =0D
> Is a mismatch a memory safety issue or just a bug?=0D
=0D
=0D
ww_mutex_lock_acquired() explicitly calls it as an UB:=0D
=0D
	/*=0D
	 * Naughty, using a different class will lead to undefined behavior!=0D
	 */=0D
	DEBUG_LOCKS_WARN_ON(ww_ctx->ww_class !=3D ww->ww_class);=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Best,=0D
> Gary=0D
> =0D
> >=0D
> > Link: https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@=
collabora.com/=0D
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
