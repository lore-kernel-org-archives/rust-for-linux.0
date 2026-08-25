Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD23E49DB
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648765; cv=none; b=UmvHrqV5bf6MqLg7SSNXJ4EHVMUsZ0GcVXOFr6E4Bq61OvLRQYvD6aZgU7AgVHIiIEZ7bVNQrwyQD96BHUsJkpYCr0fzYzJll0MnTu7rbB0LXknkxXtk6pMvukg4WUJtadZhZVSJrEh38rhIRNTrndq0NZBmTqva+LPCmr7H2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648765; c=relaxed/simple;
	bh=YtGRqmzRneJH0pC1HYGZxHgToA06+bfm7gB4b0tJGpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2I8cYMXp19rh/gRWHVn8werHrEaRF3KUDCxPTrcS5moVGB6FkeMDwq7UByYdcSoP4yz1cLkUlPyNd98RHrFz7SrmHb6wMAAYz6u6pi3h5uJxDlPn+YuftOqL4H0LA5FvNYmlhU4MUplxBDeN9YDZPOYVvS6zmPeDQvkb9Xz4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GPA2Ty+J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GPA2Ty+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1001F000E9;
	Tue, 25 Aug 2026 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787648764;
	bh=lmerwXuppXoSOB/OfgtXJMUrK3cnO1HmtVfm3jijPHk=;
	h=Date:From:To:Cc:Subject;
	b=GPA2Ty+JZtlNKmO2qblOHcsX3I/p/4oSD6KK9tu0ckYEh4d6mIYiJhlZ9SC0Pvxx5
	 W2XTOi2cFGG7IUXADGiObEyBDDemacIhKN0CsTUgnzwo38RjltZ0Orj7fyciLa7Cbs
	 rq55bSukE59Rk6TdctdBRK71wuCyPJZLq5hcJaRM=
Date: Tue, 25 Aug 2026 11:05:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org
Subject: merge problems with char-misc-next and Linus's branch right now
Message-ID: <2026082516-slapstick-nearly-8986@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm trying to push out a pull request for char-misc-next right now, and
am having merge issues that I need/want to fix up (or at least provide a
hint as to fix up.)

I'm currently stuck at the following build error:

  RUSTC     drivers/android/binder/rust_binder_main.o
error[E0425]: cannot find value `THIS_MODULE` in the crate root
  --> drivers/android/binder/netlink.rs:16:13
   |
16 |     &crate::THIS_MODULE,
   |             ^^^^^^^^^^^
   |
  ::: rust/kernel/module.rs:52:1
   |
52 | pub const fn this_module<M: ModuleMetadata>() -> &'static ThisModule {
   | -------------------------------------------------------------------- similarly named function `this_module` defined here
   |
help: a function with a similar name exists
   |
16 -     &crate::THIS_MODULE,
16 +     &crate::this_module,
   |

error: aborting due to 1 previous error


I wasn't paying attention to the recent THIS_MODULE changes, and can't
seem to figure out how to fix up the netlink.rs file to build with the
recent changes.

Any hints?

thanks,

greg k-h
