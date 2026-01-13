Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC17234F461
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345904; cv=none; b=Pp6qOOswBcj8jV9ZewMon3w5ikdwIjEc/fi0+1sHYzIYrWvkm9VZsdZPJd4Ex4c1kghvT4zLGwUbD53Yl/JOOYtx6jFnZivpr7GiggLncfBLaBv5lRQb8HxrlEXLu1MhHq95kByFakus+1zQAUmt6W3iKEBOHgq+CQOkWAFSG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345904; c=relaxed/simple;
	bh=xE5wvtrp6gzW1gwmsQun9qvnGk+tP6KzYgubpOTkQ1I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=E1C3ouUqvIzlYnU7IqRDICKZ5HL9qzJyDrFKk/0mVEjocYarC//5swYXxVWnX/ghyGMPdlrlcj3E5FEnJWo2g3CNx8BHOmT/fbQh270NZukg5Ts7LCKJC+Ur6Rd1oEyY+grME88P/xSwWQB0qYmi1N5XOk2uktNa97IABozJRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpbAb0GS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpbAb0GS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D19C116C6;
	Tue, 13 Jan 2026 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345903;
	bh=xE5wvtrp6gzW1gwmsQun9qvnGk+tP6KzYgubpOTkQ1I=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=SpbAb0GSDUsZHX5hy+LAGQnJlOJMVrR/l6IEyMzEJycbEYNdAiYn52RfXRaeZQ721
	 EuPf6kPaBQDVwh8U92wvW4W/v/mMNXHD8y//a+ap4wmwN3YSn0GTLzUVsM+8IIQs1y
	 XkzSgX+K2HVlnivet5t0ZpOhV9Mzt3uc+u9n7dGjbb2ad/KWAxrxNtF67sPlZsIQLZ
	 BY8j6dllIU4R0faiUU5ThJU2I8fcRxsY9on0vj4qsA/4l7RgzbWiuf0y8O4ToFp6VX
	 CltkETnXNVBoOxAMHaHbESzZ8taJtbRuPyN2YbUz9c3ImD+jPZB4Pxti5zBjn0oPlC
	 tfIbXOkVEeB6g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 00:11:40 +0100
Message-Id: <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>

On Tue Jan 13, 2026 at 11:53 PM CET, Timur Tabi wrote:

It seems that a lot of the feedback from the last version has not been
addressed:

> Alexandre Courbot (1):
>   gpu: nova-core: implement BinaryWriter for LogBuffer

https://lore.kernel.org/all/DF19KTQTKOS9.33N1KT9WNLAUO@kernel.org/

> Timur Tabi (8):
>   rust: pci: add PCI device name method

https://lore.kernel.org/all/DF17TCJPO9RT.2BK28ZOQSF9SN@kernel.org/

>   gpu: nova-core: Replace module_pci_driver! with explicit module init

https://lore.kernel.org/all/DF17XPT1MU64.ZXT4LSXR9CIG@kernel.org/

>   gpu: nova-core: use pin projection in method boot()
>   rust: debugfs: implement Directory trait for Dir
>   rust: debugfs: wrap Entry in an enum to prep for LookupDir
>   rust: debugfs: add LookupDir

https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/

Especially this one is a concern, I don't want to add this infrastructure a=
s a
workaround until we land the feature Gary works on.

As mentioned in this reply, I think that debugfs_lookup() rarely is the cor=
rect
solution and more often indicates some kind of (design) issue, like it does=
 in
this case.

Before adding this, I would like to see a valid use-case elsewhere.

If we want this before Gary's work is ready, I prefer some hacky temporary
workaround in nova-core to access the module field instead.

>   gpu: nova-core: create debugfs root when driver loads
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
