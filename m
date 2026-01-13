Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A202BE7D6
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306147; cv=none; b=IRO/T3T4S7zomOQ1lcZqyRmbLtoTrJCIrtPjfK7jA6JhU1QjPhJaqLKapuHUURcI7f97qPRrQ6iKYCy7ImopxlROzyaMMFsuCtYXHJiF+Z6+7NNnffSoO5ZDRR+2/vJU9/TtoDkIotyH/br6r8DZga9QlpDVG9dBWxTObgZTEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306147; c=relaxed/simple;
	bh=S+5F1iVMqZnkDT0cVdGZIEJMnWOmXSfP/2sZFwJ4AfU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SIAqSSxUXkzLGSkMwUmRW/hjmXF/lUuC/4zehfRqyqRpkMAGJNprMuF37dMaMMPCWNsckVNPn7DqN8xYkSx1VCey4IJOPy5FLrf82s4ypdScQZQy5iYA0kVotMzp6ZEdqGXiPRL5z6jq0O+lhLVSxKiREwKudv0c7QTMvt47DG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4sz16xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4sz16xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6FDC116C6;
	Tue, 13 Jan 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768306146;
	bh=S+5F1iVMqZnkDT0cVdGZIEJMnWOmXSfP/2sZFwJ4AfU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I4sz16xsVpyIKXdGLRc0qdPXTl5y3LobV0P0TKap6V/GvaF0VGfLHZv8x7EXGkoSM
	 Gjox70lpoaEnOgwX+IDUfGiNjRg5Zbe1OCNwytfkzTdOfcDtaDbOYwVp2Ky0K533iv
	 vbp/K9maPKDAaqCX/yprz8UJBWV17nIxY5q5b/BGIxwsQ08B/QQkJ1CaA2eMXsY5q3
	 0a7+7J94PR+hco+UXTe7RE0EWXVtygy8kvLMSXL75tp1TDArkURfASyVbjysBu6FgB
	 W3TCn8bJMmZOOikoUQ86rcg94Rf7iPDAvb1SFcFWkuj02mvPR8AAqVXX9GwgBnOfvP
	 HH/CWa2RXThKg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:09:02 +0100
Message-Id: <DFNG7N43H664.4YY2IKBCAD94@kernel.org>
Subject: Re: [PATCH] rust: platform: fix remove_callback invariant comment
Cc: <rafael@kernel.org>, <tmgross@umich.edu>, <aliceryhl@google.com>,
 <a.hindborg@kernel.org>, <lossin@kernel.org>, <bjorn3_gh@protonmail.com>,
 <gary@garyguo.net>, <boqun.feng@gmail.com>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <alok.a.tiwarilinux@gmail.com>
To: "Alok Tiwari" <alok.a.tiwari@oracle.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260110115159.2313116-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20260110115159.2313116-1-alok.a.tiwari@oracle.com>

On Sat Jan 10, 2026 at 12:51 PM CET, Alok Tiwari wrote:
> Correct copy-paste errors where remove_callback safety invariants
> incorrectly referenced probe_callback().
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied to driver-core-testing, thanks!
