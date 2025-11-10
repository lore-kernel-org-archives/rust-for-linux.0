Received: from fgw21-4.mail.saunalahti.fi (fgw21-4.mail.saunalahti.fi [62.142.5.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B529E11A
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795552; cv=none; b=d4nSLzQUORASKDK4gxkoPHq+rZFy8iwK2Rw76tiVUkD1p6aRNzmM8dN1P8+nbv6GEI0Xec52v6fzxLfQjq3oJxwj47hXIqQzTNYw53l6lsCQWZLL5NCgN7j0vrNs0IvZNBB9IhsotFkGCV0OIe5PSB9bIe/HgxwOIGh/GcnDsMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795552; c=relaxed/simple;
	bh=9kQG2QkPYB4SmfUk/gXpicACOKdbS77VOpLDlU0SGTY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WSH21ONU4YmTHni+thnUWMmNCUqvdFYY4jCtE+m/JyJJKu8hLHrje9tMobPUY4qWiXCBsnMuSEBWdPvzUiWY5TJZ60+DRwKS4s9sCdlmQG0E0vihvUN+xQbCgqLDBE6+BgOYke6TiikxrAQPnnhfqgmlCL1bEBdYPi3/enJv+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi; spf=pass smtp.mailfrom=paxsudos.fi; arc=none smtp.client-ip=62.142.5.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paxsudos.fi
Received: from mail.lja.fi (80-186-162-127.elisa-mobile.fi [80.186.162.127])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTPSA
	id 21ca0f43-be5a-11f0-a2c5-005056bd6ce9;
	Mon, 10 Nov 2025 19:24:37 +0200 (EET)
Received: by mail.lja.fi (Postfix, from userid 120)
	id EDFA414A6AE99; Mon, 10 Nov 2025 19:24:36 +0200 (EET)
X-Spam-Level: 
Received: from [192.168.1.186] (vartija.sokeavartija.org [192.168.1.1])
	by mail.lja.fi (Postfix) with ESMTPSA id 3204414A6AE8F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 19:24:17 +0200 (EET)
Message-ID: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
Date: Mon, 10 Nov 2025 17:24:12 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: rust-for-linux@vger.kernel.org
From: "Lauri Jakku, CEO Of Paxsudos IT" <lauri.jakku@paxsudos.fi>
Subject: [RFC] Secure TCP (STCP): Rust-based encrypted transport protocol for
 kernel integration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Copyrighted-Material: https://paxsudos.com/

Hello all,

I have been developing a new Secure TCP (STCP) implementation written 
primarily in Rust, designed for kernel-space integration. It provides an 
authenticated and encrypted transport layer that can operate alongside 
or replace traditional TCP, and is implemented as a loadable kernel 
module with Rust userspace hooks.

The project includes:
   - Kernel-side Rust module (out-of-tree)
   - Fully static userspace Rust library
   - Secure handshake and AES-GCM transport
   - C ABI bridge for compatibility

Repository: https://github.com/MiesSuomesta/STCP/tree/main/kernel-module

I would appreciate feedback from the Rust-for-Linux and netdev 
communities on integration strategy and long-term direction.

Regards,
Lauri Jakku / Paxsudos IT

.---<[ Paxsudos IT / Security Screening ]>---------------------------------------------------------------->
| Known viruses: 8708706
| Engine version: 1.4.3
| Scanned directories: 0
| Scanned files: 1
| Infected files: 0
| Data scanned: 0.00 MB
| Data read: 0.00 MB (ratio 0.00:1)
| Time: 19.142 sec (0 m 19 s)
| Start Date: 2025:11:10 19:24:17
| End Date:   2025:11:10 19:24:36
| SPAM hints: []
| SPAM hints: []
| Message not from DMARC.
`-------------------------------------------------------------------->
