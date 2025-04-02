Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238A2E3374
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619464; cv=none; b=kG7lGjSKy5ZPuWFQawQ7Nur7HKvgW8zQAE62pV+4GXbwHUrDfOIAgy8wI/nJ5IhJkr8Hqra9lxdiYI+6LAp3qpMrGi0IfyWbZ4uX6yzV+a50VAg5ufc1S47Dsb9zdVWC1yOMf+zcguo/9lFf2koos0WipGshLIFsisogL3Bkn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619464; c=relaxed/simple;
	bh=VayQds2ayyM9+xgq3x/LM9LIfx/jSSesdZ7hMRm0GsM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZYC+f6dcG9GHMN6Qcrmyi+GtJE5jyPCWaXPqPRZdaypvTbSJeUtpJ9tf1bh4d54fdxmZoNluqOK9LFaohCKX2gPIxL6LfPhDB5UfAc9Bvgq4ojmbwfpTWrDir+ePMPp1ti2UaPyMTSQP1w+4OJZ/sDdBu/qBBkd+CvjqOTvyLa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=metaspace.dk; spf=pass smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace.dk header.i=@metaspace.dk header.b=Bz3k9xWc; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace.dk header.i=@metaspace.dk header.b="Bz3k9xWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=metaspace.dk;
	s=protonmail2; t=1743619457; x=1743878657;
	bh=HS1bphsS2xykD5ZMS63+T8B5MDAs2UB1B6kD3ubbuLo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Bz3k9xWccyqaibtniMClhRwQE2oB9RAdxt0EG1uH1b/TnNMxD9vQQiO93/KZXOI90
	 +d0F5a+2WIsw94TGjgAbV2VHYxSsPPfWfite6S0RmGYVy1hcZLCH2ohogT3b/EYenf
	 1nm4JVowUl4sELztwCCR7fNgFGb6Y2oxSOb1qffiRDgFdtXr2P0SfeqTcis7EheH13
	 K5vMEE68pXIyrzaHcYJzzfyRtWK13LTF7MrcvQJtq4LsXGJvlolADlDxS00nficqqv
	 Mw4CWm455P6vk6ujJOYaOpmIL22lVAYLxOdrJ8MsrW4Mp5wPW8I6qo8BDsf8GknBkJ
	 iwQzCxuPZ8MDQ==
Date: Wed, 02 Apr 2025 18:44:10 +0000
To: Daniel Wagner <wagi@kernel.org>
From: Andreas Hindborg <nmi@metaspace.dk>
Cc: Boqun Feng <abstractionfbq@gmail.com>, "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: ABI stability and Rust
Message-ID: <87iknmv1xs.fsf@metaspace.dk>
Feedback-ID: 113830118:user:proton
X-Pm-Message-ID: a7cce5a29609ab7f37920c8de373d341b37852dd
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I just wanted to mention that we discussed ABI stability in our
bi-weekly rust subsystem meeting today [1].

Two solutions were discussed:

a) Ship a blessed toolchain for each kernel image you ship. Users
   building out-of-tree modules must use this toolchain.

b) If users cannot use the blessed toolchain, they must link all rust
   code into their module and ensure no rust symbols in vmlinux are called.

Outside of those options, I don't think there are any other solutions. I
would not hedge my bets on rustc getting ABI stability, ever.


Best regards,
Andreas Hindborg



[1] https://hackmd.io/PbZOPV1HTwe0hjZTlDGnmA?view#ABI-compatibility-for-Rus=
t


