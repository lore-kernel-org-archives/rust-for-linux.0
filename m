Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921C2CCC9
	for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840119; cv=none; b=EbSq94+YW3iSoJU9xoHZ/CC5zc0C4cGEMIeddDQ3ybOaM8AIvEuPrgrQ+aKHRh4zFb1AA303vwe4O4K4DuM7QrKD+CiSUjjwQCO+1a98X5vVgSem1G5DlxqaYV4foO5KCkE257BnvtAwrWkpdSTBM4XD+CiKWyHIX2bojC1ceXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840119; c=relaxed/simple;
	bh=8aacZvVojt4RhD/Z/zmwxBy+fkXTrtvgvETGMb/Vg8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHvAzL/js/lgp3alZzAjyvf/hkHvQTrmM+KhyroqqN6W79kx4YIq9wXmI6Y8+ANHUnLCLeyBNIaYqj6EPvHiKqWEy7hWpaQcreYTAAz+0fT21Cs4A1mHCXk/PjWueWiU7HSWM+MC76ZDO3qBUqDPDzyPZ21vAis85USzRDGtbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mdSSe9EQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mdSSe9EQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BA2C4CEE4;
	Wed, 21 May 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747840119;
	bh=8aacZvVojt4RhD/Z/zmwxBy+fkXTrtvgvETGMb/Vg8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdSSe9EQMgvdHby2KGxwWy5BJaAZF/vbrxuEfoEeuqiGQdIdK/kSKvuIgJ8W8KM/q
	 AtoTiLO1o0yG3CWRQ2qgfORdBylDnrWzNSfX1XtDrlcOoJWRzFxWkHTL6AYziuzT2L
	 Wd9oI13MBRqiATizvZrDvEBmQCLeBo0ShBMUP/BI=
Date: Wed, 21 May 2025 17:08:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, igor.korotin.linux@gmail.com
Subject: Re: [PATCH v5] rust: macros: Fix macro referencing core and kernel
 crates
Message-ID: <2025052123-delay-sliced-4881@gregkh>
References: <20250516122349.1944895-1-igor.korotin@yahoo.com>
 <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
 <CANiq72=Ae7yiNiVO9jr38kMW_aMOOY+q8OCCyh88ceF4z7GphA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=Ae7yiNiVO9jr38kMW_aMOOY+q8OCCyh88ceF4z7GphA@mail.gmail.com>

On Wed, May 21, 2025 at 04:12:43PM +0200, Miguel Ojeda wrote:
> On Mon, May 19, 2025 at 6:49 PM <igor.korotin.linux@gmail.com> wrote:
> >
> >  rust/kernel/device.rs           |  2 +-
> >  rust/kernel/device_id.rs        |  4 ++--
> >  rust/kernel/kunit.rs            |  8 ++++----
> >  rust/macros/kunit.rs            | 22 +++++++++++-----------
> 
> David, Brendan, Greg, Rafael, Danilo: I will pick this one up -- if
> you prefer I don't, please let me know.

No objection from me!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
