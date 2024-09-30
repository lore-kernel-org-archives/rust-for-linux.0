Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0318DF83
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705529; cv=none; b=K0DeF5/J3F+SVUwQTQNSsmVK1LLZSwhK2bSasAj5HHThg7Sj6dl7E0qkP4376QRKgm/O2mOD8IVLqPfUEhwmkKcQP5cqEsMpeZfqscXLLQMU0hZGi2LfBrFCAC9jgequxqV0NDzoO0SAWfAooiSNyNARdqqrLY56oSa6IM4NW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705529; c=relaxed/simple;
	bh=Tcs2c+o7KHJ05p9TpffXIK8Ul5WXF4M7PQIJeavgb5E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O69KQQ5j3PlheRD4YbFRo1mkmj6maTEl4fZAnea5sPgsdFXftA+R/oZWqilyTOxGbmIDNbRzmRpM/l7JqZ/mycMvUVSonh/ElsFh5ZBns8KMaqKc5PCIiBK+XFAGOsjnjWKuZ1ksAukY53ViGA/P8edmPCjY7cttT52lG3ghf60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYouvzAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYouvzAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635A3C4CEC7
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727705528;
	bh=Tcs2c+o7KHJ05p9TpffXIK8Ul5WXF4M7PQIJeavgb5E=;
	h=Date:From:To:Subject:From;
	b=iYouvzAETRjueKGfVVzZ1qZ3zD4d977OB8RaPboIH+ZazWFKGpIEsvnOfv9HImp1w
	 Ea9XF3F0PfuPLSo1dZMCpXdgpwrK0L4cYnc7AIBGIyhbxGuZpJla4Mssb7OlVJJ2Ak
	 6dIComQnbeO2rCxkUxG3j2f0UTiVrIFShCMQlznhr4hGhcAorzD+Ehs8GbeUgw2Xpb
	 zdHm3CJlQok4TPD3NJjX5cOSGd2Bsj8nd29QV2EwtgUr35OcSR55uPjCwaZe37x4Sc
	 Q1GigwvYQZNkAsyaPcXDxHNOef/+R0cD9F3o8uUKIX4vTZFZjHy5UNR5hn8nhE9YCC
	 su9oJVbwnupjQ==
Date: Mon, 30 Sep 2024 07:12:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: rust-for-linux@vger.kernel.org
Subject: LLVM toolchains with Rust 1.81.0 uploaded to kernel.org
Message-ID: <20240930141206.GA506883@thelio-3990X>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have uploaded versions of my fast LLVM toolchains [1] that include
Rust 1.81.0 [2] now that mainline has started supporting the latest
version. If there are any issues, please let me know. I will bump these
to 1.82.0 when it is released.

[1]: https://mirrors.edge.kernel.org/pub/tools/llvm/
[2]: https://mirrors.edge.kernel.org/pub/tools/llvm/rust/

Cheers,
Nathan
