Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781614;
	b=cRMSPLcsh+Qn0s+G+eBrZ7MH6uAdXrTh0eIAUw4+YrUCXYclQLLRLMjs0eL6ZfleA5kT
	 ZBf+mfNMQm5tC0MOEGh0V775Y8OFSw+NMPeEAJolm1tH6xE3giMf7RbXaCq9xxfbToUkT
	 LIRgVzpWs5Z41I+dY3g/2CzJdRgbkcKZ+/BEMhr3QP61p8wERwBcibxJMmUORJU08KbH+
	 Ggnn/b0mHA+3v0jmROFeMcr1pIm6egNPpPT1wh9CO0UYOeHq9m5NycyZbaP+/+bf7QnoS
	 cpeKAbg+VR28H0JzA+WB7M+d/RFeqXKr6Gbe/IxlNTp83TaYPBgk08BEgzIY5rp+UQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781614;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H70rAsqDd/+AoMBICHrr1CVS1yQL3pOatKeHtbn/fqc=;
	b=HFLy+L1xMI3SBbjWuHEj5R4RvqGL2EtHRgVubkotYJgdT/KANkgKjTxAod5SDIT00rew
	 OuAX1S0n38Z+p2bkN5tFi7GUPQhu9efXKck7XDhOljqAcPXYALL8eSDlKlTQ9+86EzpCz
	 MeHr7wA8OVJ3jVp1IhfCDlAreJvl/heMj8YvhwTPWJ6lFkwx9x4jq/wSNcEJrHcjraD+m
	 d45vuqKFeccMEXSAuljF73IjoCHG44BrdJFNLf4gQnNELjC37KX1fvOG3IhG0SjrWaqwc
	 gxComgoPs5FgWqRldWgT/zYZEGwm3b5a0ixgE17yzdmc0X86bmXuycrm/lfpYV5c49Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=matt3o12.de;
	spf=pass smtp.mailfrom=matt3o12.de;
	dkim=pass header.d=matt3o12.de header.i=@matt3o12.de header.a=rsa-sha256 header.s=securedbylima-20230709 header.b=F0afJlIh;
	arc=none smtp.remote-ip=91.216.248.203
Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61638606A323;
	Sun, 15 Nov 2026 22:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61638606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=matt3o12.de header.i=@matt3o12.de header.a=rsa-sha256 header.s=securedbylima-20230709 header.b=F0afJlIh
From: Matteo Kloiber <kernel@matt3o12.de>
X-Lima-ML-UUID: 0bbccc4b-eafb-4d59-b301-18d3d57f673f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1794781605;
	bh=H70rAsqDd/+AoMBICHrr1CVS1yQL3pOatKeHtbn/fqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0afJlIh36LdOWU/yR723YEDCGdV7vz0vzPgGDfRb2aa4uiBcmenyF0IcEtp5sRBi
	 hP1QWFqxQBm4NOreCKlfLKJZFYAu5fuELhKLHCpI7hqPTbjAN+fYPyT9bdesXVaSNM
	 1LMJDLrUWczucqNKGMAr9rhtH+gPe8n3Pf82ISLQDmBo6GwCkyfC7q0xnyYSBlYrTM
	 BmJnEx2gUnG3s7ZW48bKN3SgMPn5rZHhE4cK7VbUKgxVys6breT5FGsy2jhceCkL6t
	 WZNsLdy8Z+TRCpX/TTRN1Ak5C/xJcVT0M3BGMRD7JBi2iKWIUDrfkS32nr2ec7mmcV
	 +lgXl9GnwzYjw==
To: acourbot@nvidia.com
Cc: dakr@kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: scatterlist: honor the device's maximum segment size
Date: Sun, 15 Nov 2026 23:26:33 +0100
Message-ID: <20261115222633.393501-1-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DMRGPTJ9CH1A.2M8LD751KZRIB@nvidia.com>
References: <20260831233215.287881-1-kernel@matt3o12.de> <20260831233215.287881-3-kernel@matt3o12.de> <DMRGPTJ9CH1A.2M8LD751KZRIB@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue Nov 10, 2026 at 7:35 PM JST, Alexandre Courbot wrote:
> Hi Matteo,
>
> Do you have plans to keep working on this and follow up on the feedback
> received on this revision?

Hi Alex,

Yes, I do. Sorry for not getting back to you sooner, I was unusual busy at
work.

I've had a patch implementing the approach we discussed ready for quite
a while now, but haven't found the time to review it properly myself.
I plan to do that and send it out as an RFC by the end of this week.

