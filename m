Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D54748C
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Dec 2023 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r3AuxtUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B341C433C9;
	Sat,  9 Dec 2023 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702112735;
	bh=sfBK3FVn8RoSAAqkF2aTG/P8DWIJRncdWIjDsR6jFYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3AuxtUn1FrzlX6jgof7CR3ENcy2cnRDsZgNlRAo5Z4SM/kh6Ms9ZuBvTQG0qCYx9
	 DOutLj0KHhYm22EaXfOi8SEz05gcyIejpg0HKFl71moRDKgQIbF2/3NE5JorBK5njH
	 VcreswWWrlIky05atE63wVf0zH+2zlaDyf8hUKqo=
Date: Sat, 9 Dec 2023 10:05:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Li Li <dualli@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] binder: use enum for binder ioctls
Message-ID: <2023120936-decency-engraved-5346@gregkh>
References: <20231208152801.3425772-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208152801.3425772-1-aliceryhl@google.com>

On Fri, Dec 08, 2023 at 03:28:01PM +0000, Alice Ryhl wrote:
> All of the other constants in this file are defined using enums, so make
> the constants more consistent by defining the ioctls in an enum as well.
> 
> This is necessary for Rust Binder since the _IO macros are too
> complicated for bindgen to see that they expand to integer constants.
> Replacing the #defines with an enum forces bindgen to evaluate them
> properly, which allows us to access them from Rust.

Does this mean that we will have to wrap every ioctl definition in an
enum just to get access to it in rust code?

What makes these defines so magical that bindgen can't decode them?  Is
it just the complexity of the C preprocessor logic involved?  Any plans
for bindgen to resolve this?

Note, I'm not objecting to this patch (I'll queue it up next week when I
get the chance), just curious about the rust tooling side here.

thanks,

greg k-h
