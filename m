Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278926FA6F;
	Mon, 16 Feb 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241038; cv=none; b=g6aiusMErOMl2MORmjc51F5g/geKaop8YRBBqyAqubTzkTW/3laZBPhXFVqXUyifZc7zLh9Jj/u09Emv7olE+/2zua2Ar5G6SehvOB1owrIpkXcIsn6vYTvOTzOZBbaa8zOxtKjRyiyvPbw/j9Wfevgu4XWRWgmK5bmLQvnu90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241038; c=relaxed/simple;
	bh=KXIoGNCiKdVC9/tDYiWuKPX62BnSC1qicRAwAyXyLfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAu4ciuDU+pfsvzV9ahTaLwqkCmLtiB91crUOF1p78QbCU21MlFiDzYlh2SMelQcytGT6Oo+Wx19zePxOrLRaYZF+8IeT2nVxFiqmaWihjZvuexEyPQFnkqmzEXqd+ZHSl6v58A0LQsRxBOToQ7ks7QXnKN+nY1W56cyFJnJtS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=slTDRFKC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="slTDRFKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1771241000; x=1771845800; i=j.neuschaefer@gmx.net;
	bh=jLx0WCaLMjp3lvLh/r5JfmxhvnvExNdesRviJp6D4ms=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=slTDRFKCglRsr2uABGqFcDFdC1CiY9uHqSHUU3Tzm68EJDcO9a7KT2tZzjogHCx0
	 StryXrhqWUQL1/jfFIKIHGaxh1XhBxYkW74n913nu4/UgWWEYkxk0d4GLfcUtotmh
	 av8tqS4o+GeRmM+wzcwX9scR4n9WME/5FAsNGNEt4nYgTpus5IR4T4+JXCFhXxYJI
	 yW+y3TeSNJfCEL0Uf1ehslrQ/0Jvcr8EAW629kbukYxwbrAM8ePhNnefcZ3Gmsetm
	 JKjn7jLz4Zyq48pbpuVc8f/QGcKYCEOL8ZO1CibJ3unKKEWOqX++HU+CqNKp8QNBi
	 /jxTIo6R7cavRejmlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([213.196.210.86]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1vYSXe1pXS-00tkKW; Mon, 16
 Feb 2026 12:23:20 +0100
Date: Mon, 16 Feb 2026 12:23:16 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Rust version requirement (was: [PATCH V2 3/3] powerpc: Enable Rust
 for ppc64le)
Message-ID: <aZL-JO3950gc9YO_@probook>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-Provags-ID: V03:K1:TZEGS3yIRnzGTsQgtyXI//4X3xREH7A7RhFb+PTTLu+uFjBmyja
 cupRUBg5GUrisD0dve5yzDO+sy0lDqiz62j0TLYG3XNc2XdfqO+CxdeanK4zP5SFIat571A
 wCc7WEtUVDZ/h+/fL/rgFPEXuNfqUILjPZbSns3jswERweP995VxekB/KO6MMHAHVCBBdRk
 2vxk14Zxg0vaq9DWMUxcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vlbPA7YVLe4=;UAlY9dtLPVdIy1fPGkgTvz3RCMg
 OCk5NnSIQcEovvMakB5jPTa8P7SAKHLEYPlbzu75HarvE+ex1q3qofIqNrb490JYFvd8fdxKL
 dONfH5tbHyiP0ax0Epeu0uanq8Josm6ufVqMw1fcQ9kZHD5cytEoAgN5OQfsKp4AKR64FspqV
 S0GejUhzjqXytT6g6kTXb1VZvLBKxPK6+sTIoeT6jTT5plvdtFmn98xrfGTUfH0449YDXk4fj
 jpCIKbA/kPOrvwnOKjvzUGqB+K41OcuvCV17Ch0ySzuP+LyPY6vErAuPQduRUv8Lb/EJvJOjd
 1+vW3s/xMyC8tSx5FQiC+5NMPRnaexcbc/f+NJNo0lB3E5WgU5igzyZzuXlYhnTMiKYtm1q8X
 nxjt+XAM48aASHkzI2vSPun1bmuE6iRWvDt/z8rjJ7irBnqfwuDaEvIA8cTHdnahqL9481BwL
 WEmHJL2uJSXYD8W3Qxw/2J/3Ubm2YxRJL3ebk9pTIW8fmc5akUFzjqCBrWlqgULo9ihaxGusn
 dwce+RDPfkJ0aGPzLEk+BAkfxdTBYsoDeABcJeBqBtJYoL6NPPZMe9z+M5lCUw0ksps7WvmWQ
 VI1oTxPT9P4W5V0kEgyMdJMZCEBCcI8myWWvFAtGWz/OACXhuw8GKfx/LKT4kPPhhg//DfSK9
 KVvK8/7yAyZVAyGnsc7M+k6FQns5gj/JK0cpISrYS9oBNB2qy8j/hu+knFVij5H6bOZkB8A05
 pZFsRhip7+vHkKCY73nSnwibpiLivdExVHaIE9BD/lUmFzeXthgn9jpef/Sy4yjMvzNy5TaTN
 KZkXeC0WB5tzHNQ04ZQnnz4BAerZFklkE8NMoI/jCimb09BiIHEokVWBlRmSwGqAVwrLLhw+g
 AFrpPIrUrzFDKp/9upUPOMNySlMmOFxXY1s+SXIQ3B+fWOQR4Pp8oFH/KUOBqciL/+ApH5KUq
 dvxG02tXe8Ernb8o7cnR/aOOvT32T6GCdJy4oSdVgzNs6DSVqdQrIqlq0wKJs5eS+V63cl8+t
 9mTa70A6ZDJQaz4ZNqs9jmV+1q9Xf+jTWoNWUZoeDUFl+HqdjjfyonkOpvakq5WuI68LXGy8I
 +XA5/UgoT8g2Ln0EtogDfF54b2I4HWsPgJG+U4jGJuKN0ePRAFpiZg1zPFk3e62TccxfZJKXq
 ludjzwFBc9ZhHFe/bn+v97GVrcncar4w9gdwLITT15iRqExiV1x1B8m7FtuiMhmeqT9RZlI+q
 WodEA5to1DzHqth8JCEFU5BOPF7otk0TPnyWU+UK/H0Vn5H6hmDxVdRQTxiKdqXq1/Htr9QkM
 eQXJRVIOT0/4JS+lQD4NfuqHITvUvMj6x7PU5oWgTHSNiiKEQulYl0pirU3kKpFCegMjgiXnw
 V4ruaRQb4yBy1+yrNztY+0RrUGHLByNCuLvM89BWUCHWWKenvaU73WSa+oxx2Mq6G1j3RhHRW
 FMR4BYZNOur5JxgGDq4uuo/P7NJD3k0a8a/+SZNq7/j6nIAdApKQ2B6/FaWShoCmNib002uiL
 9Hpy+INfHJp7M9SX+aYuwCBqx0L10j/C986+PEfvk7b4qW+XIrCCwNiTlLvShsMCuFpt+X5/J
 CuSHFMoHEfGRvc9hiiWmDjYBbjBb7p4VjxhCWrW9YkJZRWU6oeL67LnqMH+hlMsswz/IHgtWq
 lau+b7cKAwlmTD8Nsxw/2c7Jz3whD74UkUR5YtQCB452hezPbLyLmzd45zp0nQq4gR1dUMUa8
 FZv/qVf20176j4ka+2DMhaWgxzByi+xWg+4skLULUbfQhxKcu51BNrH9AyB+lySYI+hfpqVbf
 uRJVdTTUSKsXkEPsNyPMywMeAXxcFmjm+TOBBU4NBwnMVkcvsEGrSfQ/uelx+6mC4MGEGt/Vn
 xarQHAq0b/Uy0PXUOrovWEFfmIAbp03mydJYF/6ApN94PfUTKF9Ke31wvuK8UNMK82wtQdNJr
 PA5pGAZX36m7SY+eyLEkkk1lCmoAebIXDkpV3SGIlCE/lHKKlf9Bho9y9O5wJ9S+zUrOw81rT
 V8MiHBPnEHe3fAZx3iCYHtmtiXZHVjdGzMygCQEhiogj4OB7NVYyOjpQTEp6LzRT2AZEAXl/i
 6rDlmLQYZjHDpuIj+qrNHftGzb9DqonfX6ApwxhpxX8LCjMgaqO3AeHE+myNACd0K4L/BNMga
 BR896A5T2X7YR3mF8fln38Lz0zZnMX/eq9L/b/iZ4xKaFjPtehYNjqKIQCJ/QBELwyYs0Udzw
 LH0lgNaSCAKnNCHAHY5bRJALL9ciiQLxn+/yKHwPcIiz4w97bQXL/W7XpgPRTDwVD379ozOvJ
 8zXzBb+5bqznI+FbEDYlezCLyep5dGSVXodkuQ0uB+e4vI/q0xBsgwLyIJJMDQiB8qMjke9Ug
 eZ9wG4joF6doxuGwG3Ew76/ZIQ1wGTa0yt03Fuxc5LxxlDtrFf+NlqIbbIz6RIA/r4tvK9rU6
 cmPHj3g+HrWUbwxQ+46Z71ZNjkjf1DjxudNwPlfNXoyGydjvGYpFIp9g1xF3330nEg+7LkulW
 +CeExj70LDdiY6OYx83O2fttJCDXic561eG3C6rT2mYrQdk9VkLJgGmmkVnuzux66pemD/i55
 ezFNdkBG5ArlrZdR3OMO8cQCu+vuK4HoMTf/whsSLZTSDaiXNkE5HCZ/S6ysn0wrW/M5tHK8K
 1L7D6U5lsm+AnABxqZo9MZ/G4aPs3hIQsnzcRl78k0Oe2lX41JLbTitH+yeXTK2Wsq52Qc1VV
 V+WNWbTP7lDjLAgnfU3h8kk/QvQr8uLwr7zFVLG4jFcntOpg25HgkN4EC/Th93Z/+avlyrlfw
 KIiW4U2NZ/ZGMYyhZUnN6Qfxim7cEdFQqAulf5DvNa5jBAfEMOhXJqCrxedoE+ByTESrTnT0a
 ZMGyi80lwbB9YYxr8jEWz7Thd8zMZ8pxIViiGnpXrjCWBXmSuQEHk+VmQiTh7oDjMwnDbfzUz
 4WR0RjWgke086um8OqrDbJLhpOoA8dVYBKxa2VNcQc1u/6vMWbt2SHeIyIZESAHqETuw+mAaZ
 iXFuCQsWTVGjBENDeQmPyweEWdZKMat89UgzBD+o5CocFOQdV3/L2d1Tj5hR0VMMvgnWoghvO
 G5O3j/HVJdrptFdKa386ond+apr/rL+FjWWMbkzp8t5neDd2a8p74hs04wAR+aDZ7dtOFKWUA
 Fgb1s49TbsKarc0xGAFIweg5rXEIRXJLjjePpnxI1sMrizLIpth+Jdz6IQ3GklAGdTezj7pY4
 lffGBtlROlgK+LlVMhP7g1PJIfMQgMTyfpnpfV9ZbSmjoxiqYzKCKmq969E6MSagU7QqzKezn
 lCJWJNIPuKcu5HHV1g7TFWDTamjwHE6fMiGmg3CRmBoMqAhVfPeR+PHMWavx+hYYxHJEdumnu
 JNWlZBmmmfP6j38cJqstG/YqaQsiR3aaVr4Oguy7OKF/0l6L+Altg21FbXmv82hzgnxlxyr5y
 sZIS8ydevjdEhVGhZd7U1WO+O3S0x91KwgO0Ershz/opDjqbwNfsJUjiv0xxTTn49/CxTxa2H
 pjXMj41UjWijajVYew9hFcJ541ZgUZEnFI4TvTJYFoXxDGi1FoLRZBFeXXPsDjpwmDC3OEloE
 3VrR0pjNLgObmPdd66sDJ6GFuMd+MdYeeLvukOkGfn589lcMQwJSQa4yMEcFjNs7XHcZtBjc6
 AIXeDzX8O+WVtUvubA3HswxFtUfjRPHqO8jX+wCYSSDz1qv6bS+Wd+p9RlH6DGVBW7u2PtISm
 GAWYF83ef9DvN0UGdOnJhsyDsXQmSSGvNCwQdma3fV1VaaWgXXsxx3OfYBq0o7RKgycHHgDQV
 ab4kSF8X+VjC1Pb7qUhwzUUYX4hPVPaSg4aqAi+I4VRtmXGQr08SHVzIgbQTe6tzicoH1VJ8E
 HcguaH2Aw1TQFqDHZGRdYs1QvsXEI2Lp1ywMKh8SSQH+1Yj/BNI4kix+7PFs1ej1QWRJs9Z+P
 0E3zjDOuUEoxQ+LeznZjM6lbIef6DsOOgTY7bWSuxzBq7xZR40dPBxGzc0pas1thwkUZTV7y/
 qIV8J8qKx1aw1cgS/ocnYXqj6TtY6sIRlI6+H9Igdpxu9d24bI2rSgT+wrt76uNcFfFZDxFIQ
 YS9m0U49acNYfJ9+IYRyJNTixaO6dk63bsDSs0Yh2CSxVR17fm4V4KJx10umC737CRWpyIE6j
 5pOjMgCIw0tTNNTUHWQ/5Y9W2Bd5CKUrwcQUm6PH59GcAeH0U4rGI2yZcrnfRyXgNQjoBGmRR
 f+4VwKUo5F5EaLQJQPDL6tDI5F1pjxf02UypjV+pGvkzBwVDGisnbEFPDbj7KbCyBbByYhNuk
 XrAPp4A0M0Vn3CJ+QcxUdfRlF0PxmsdZCyQBV5izJ01E4XOIYfBIHvNIOCrfI0TajtKrRm0Is
 J3asWam6MregobQ9B3n4zEijJT28ZqjCoNqVk7FJMk/10A9uLj/MMHaD89Yoap9/rjismhOWB
 fRVJuRMs1wdg68qCV0KroRS3JCcXF09DL2IAhjXrdRLOyys3UpLV3CmihczDdRIsMVM5lcsp/
 lUV+pvsf6cMAzf2YOIU+2z/10E3+CI4JmRKrloBuyOnBkvkYJ+p7fO2pe7O9jawNaHgTOQfLO
 B8sKqtDp6VUVT5S+MbvOBSt9CbDa0y4fKMhq39fUY5LHTnnRHNinUt55KKDrqddxRGuuJhOCM
 H90mnCKu9pag9G2ALz/y4EpimqqIJf1u6fnrrDafSVBzzd3UeVEfZAtMYCxEJTwYLPaGs8oVX
 r1LgIDwcnYgU1aKTOAwPxsaNm5Q9qdV2Kulbup7kw20gFpr4v4oBiur7BlTKlB76hOmoNZYNq
 0T0UffZH47RvWRrgo+T/5buPqjpLEp/onttC3KD6F2IBcJYO2bwsRgjglOw9S1MyRbjLcFmBB
 tZ57YYmjDHDD8QBK7QJnb6697nZcEab6yvT0f8V6KCCYMyTxhADzlGIVPtFB/+6Cd6NwA8doy
 RaAZ1M+807AXhDjG3dS4OVJU9z/vi+U403fP8b9BY9Kk+O6wqETvbD8KQIOeKnehu9Ww7IWHv
 vYwinx4cJ2rI13g30dk2tv2iUBJy0iirt8tyWY78G6HQebzvtfXwrD2XuTYedVtB9ejbYzKHo
 c9tbDl2A4L3qwmHBqjpR6f4sL7W0URqng1x3SHBvGet5Tc3GAHjMrVDn+8p4+3DibnQXdZHhX
 HOHwvlGL1w7R4sBmZXTq83AndcHKcPr46f68d8fh/xI7W56+eY0k3p8c+yAo6GEQ6v44lwvE=

On Thu, Feb 05, 2026 at 09:12:01PM +0530, Mukesh Kumar Chaurasiya wrote:
[...]
> use rust version nightly-2026-01-28
>=20
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>=20
> [1] https://github.com/rust-lang/rust/issues/152177

Another reason to use a nightly version is that Rust inline assembly for
PowerPC will only be stabilized[1] in version 1.94, so current release
versions fail like this (tested with 1.91.1):

    error[E0658]: inline assembly is not stable yet on this architecture
      --> ../rust/kernel/sync/barrier.rs:19:14
       |
    19 |     unsafe { core::arch::asm!("") };
       |              ^^^^^^^^^^^^^^^^^^^^
       |
       =3D note: see issue #93335 <https://github.com/rust-lang/rust/issue=
s/93335> for more information
       =3D help: add `#![feature(asm_experimental_arch)]` to the crate att=
ributes to enable
       =3D note: this compiler was built on 2025-11-07; consider upgrading=
 it if it is out of date

This is somewhat at odds with Documentation/process/changes.rst which
only requires Rust 1.78. I wonder if the rust version requirement should
generally be bumped, or if there should be arch-specific requirements
somewhere in changes.rst or rust/arch-support.rst.

Best regards,
J. Neusch=C3=A4fer

[1]: https://github.com/rust-lang/rust/pull/147996
