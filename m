Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CA4AEBCE;
	Tue, 13 Oct 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906012; cv=none; b=FX46ixcAQlvlLv9lYasJAc9Fu0Z8BXFBsXTL3gv6qURHl+LjbIzdqHPlB0S+3hg6TfCtWLD1Wbqfplns5AK5cRc0hz5yIgsd7l6bWdAPwoeRS/mXbguplsn3U1UI/E3YBjZAaFmd4FIQlrlqxZYz0XriwmVjYmNDwIAQkwDMD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906012; c=relaxed/simple;
	bh=7ituCDYQZcb9BmrS6zWtB4ozB09nWmEmSUX4U1kwARs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbS+Yok6HQwjv+FKnUxaua04FGG78ozyRbpLxTuTOLqtphOJ5Hl26ZUkACe1VBwdHrrgpALWyGG3ZEOe8AimAVLUZRKd5msCNY7FIC+a+qqDITLdKh5dtdP9sj+Urcv+kapmUySkVss2gJY1D55+UVbGxvJro7oLC3kdcWifH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mHbshVy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mHbshVy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF1C1F0089D;
	Tue, 13 Oct 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791906011;
	bh=WPJo+6dPMNengqbwJKLwGzFib4PCMTtJCzbNuPBqzbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHbshVy/ILGwVFobY0mgFNsu4NM1yzJagYI1kLZLljkIM1QBtmnia92SyMwto5vBQ
	 kdSGZtvde6JWg95FEkIzIXjGKweM3yjmHnG6Ubw+6TZ36fJMW1aJkmtkH0K/prGxD2
	 pmGL2sP+/x4Ld7gjzfoHkmc2jk6zm7zpwD1wm1Ec=
Date: Tue, 13 Oct 2026 17:40:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust: error: implement ZeroableOption for Error
Message-ID: <2026101306-unlimited-pasted-e039@gregkh>
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
 <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
 <CANiq72mfVY7a9+GyHsO_MWXiXhjS-Nj7ki54HJrMCqnQ-RgOmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mfVY7a9+GyHsO_MWXiXhjS-Nj7ki54HJrMCqnQ-RgOmg@mail.gmail.com>

On Tue, Oct 13, 2026 at 02:44:13PM +0200, Miguel Ojeda wrote:
> On Tue, Oct 13, 2026 at 2:38 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > Rust Binder wants to store an Option<Error> in TransactionInfo, which
> > derives Zeroable. Implement ZeroableOption for Error so that
> > Option<Error> implements Zeroable.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Greg: if you don't plan to pick this series this cycle, then I am
> happy to pick this one (#1) this cycle if that helps.

Already grabbed it :)
