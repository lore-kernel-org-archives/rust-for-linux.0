Received: from sonic305-20.consmr.mail.ne1.yahoo.com (sonic305-20.consmr.mail.ne1.yahoo.com [66.163.185.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99A1D5173
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418003; cv=none; b=T5oDnczzPwv1u2EFzjZGS4fQvY/HRKa4sD07POXvCFNLVSS8j4DiGHj6/w3Ji+ac3Z3yfKre/RjoGA9pD0GXHN4Cv3uMpnXf3xBDgwaokZ7cR2WIR5DMiaXwdIRq6onPsxIWuJ36AkFco12lDs+VO+LGOqJdJe1Ihkd1svYj7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418003; c=relaxed/simple;
	bh=b3RVrW8gPcXgOLlD8SxI7ZaSiCNycVimXzNCb+2qa1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZlfuLjNlHND0PJnT/S3l7y4fguhmJCHXQVNL62r2iCwnCG7sF9NUGCVazYO0NYUPu/Z5BtKVsJLWD5hH2/YIPGSwLdKurkQv5Mizur1NQ1ms2FwrVt4xX+1z3l0nHCCDLbGeZ9bSMD+PWs2vOkR0Izhj+m1u67upRmG0QAsrGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Vs/Zz9WZ; arc=none smtp.client-ip=66.163.185.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Vs/Zz9WZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743418000; bh=VIb0IkJp/pwZdI6che2dHRQ8WDwbQG/exLLTgPfIMos=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Vs/Zz9WZbBjsMAoVQSXqHUDqeM+Drvb3O3CrMHidcmaAO9oQZJo+SXTM/gacJSRMRS+gvLREkLtcRkztaiC/wlHVzFdq7isMigqy9zgqKtqE2H3eERUyGE9zTsH0Rw0S7b3R2MY4ERMwSwZQm2UtXiR8G/gB0svMLBF+gjnHyXFcGqcA4RpHZL+ozNZVpQsXiuC0LSxPAcoPU+wIeV4dxF9OVjqeKFiHkbMHKQb2ncnc3L377Do1nK4Ws3lKQlXR2/E2HxLeeshz5n6w9L9yI03TlkphQx1Rha4QspyBQTOw+uSI1hjsp2GY+v9Cr3x+D4jaticUpSGv6N/NiAy/Jw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743418000; bh=WSxtUlI+dETTikGznQCvpZuZHxi8XRO12BbjdP8Gm+F=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=tXgENxyYnua5KK9T3cE48pVu0APBbPyghz/TnTALqrkOHHsQPS55z0BvhAkWpr3k8FEqY9vkaodZTg4TLvUvakVDUWdzisigRKMzE8oQejuJF6VrJGI6bF4NWqUHhkRQe8e0N+xEuKLnJB5K5jCh3tk6wV+hufZBHtIZT+YHi3AuGBUexg7GwpASSLI3kSsexcDY9WGC20UM7EVLKFXwo/4begUUrTkQrh0D5e597C1vG8iDBbBx2GFpj3/omSII8TKJhrrkQ7VcN1AvOQ54h9pDePhtJbF7D+0iyoph5vFUkukrJJQikxvVnF9G61Z8IqoRmiV+o6/RbvLbe4SlRQ==
X-YMail-OSG: ejJVuYQVM1l4Tuj2ym9gii_k5JYLxbMh_4Nnya7MMfiUEumvmoKamnAneoK4zto
 QsYrEiBXUj.PjTvtdpQxsOJurDhbIDiWtKJVK26A7ZmF9_9K31y4lb2I4gRXB5en0Ysz_jClTbAK
 6mNT15FulW1O7vcHC93p16jx4hNgMUyUHRADzEOJXHXq7C48YkZfev.AiruTk7MrjN.SL0kvVcaF
 z7rW_UnwFmQwAYmtqvnI2Y7FO3BNayxUmF51hJMe1MTWouK8jyQqzcV_HLoZ1a8Wi5QCPp6Mii2b
 xKH0JcJ68Y8tEhUSz5.M8xIm9QBVCUsrd4mdaORW_bzHXv4gZxqoJBIbiFgB3jarzV4DpPkCfD7N
 FhJr0xg0FHP1_3E2owdO1i1z9wZr3mGKYDNwR1NZppMQitg3qldXCDackgykFWRTLZ0WkgMo5diF
 2aeitLpDanO.VFE6ce86hBYDJHXijWcumBvFAR2TmA3Ygx.AQj2bNU_MElAOgAYPv.dPNDvnbD8n
 VMckQjMngdgN3god8jDCKw.35_mv6djt0EmwbKyBwYCLwt3sVQSXv_Ed5ZWCIju9ciujD3poibRv
 D_tF_UWD0KaYjDhy61ho3SEy2rk2b_oiC_8iMv6YbDQ.qkzlc23gy.vSa4lFHIob35j.Za9Ol2Lf
 zX8aHAxMsWBv2k1tqHWGIv4iMzYaQHneTOBh8AB1ZXB5hJI9RLtsJM7_try9QV9gn_y9pT_4AtSw
 W7BEK0jYagENQ7DhTC.RW_g_oDp.VZhevt1UX0t9QMvacFMMrd5PwFhof41w6n2sphivJGUqYy7C
 bmHhxqn65FJ_Gpx3C1KUBPO0lFI5CWIuCP0O8zgCsudIL0.O0X3705vRwCGP_lIBqQqcibouFAfW
 NIGhzgAbsqZtfcqbvplxIQ1r8ttjNkQcjj3ROdzcly7uIkV6diJ.SUJrmModn7vw.dC_bGCoecMu
 soRkNzzEHM5ehRvYk3.oO4rNTYsrC4MB4g5Pcgjv5qPKHQpT46sidcqohSpQR7eXbufbkjFiewud
 EFHI1vPWQRT8hw.2mh6AGjiGFD3ae3HPzLi.iVv.lmXgfO9xmjIGfPabZoxUF3T1iZTjWU39y4yT
 SPOjeQchtL4z.VHlIkhwwS3YwJ5yC0eSoW6udyjxcnJTqXQBvZPjadwA5uGRt5_Flyj3NmtAQFJB
 jhBZgs49Fv0_N5kR55svwZcEiSoD.iFLDYVJtbwA79bjKcvsWaoZtgXVrTVgBAtQTdhfbqvWsIzc
 LWC36oyH1FION7NQkzsFHmpjRoPm.UKPwJoe6qbkuSuAY5B5aHEPhJ7k82yXgq1z2QCqXSBURu35
 ISyQLLcm0Mbnd95vFlseQ6bNviMqdWoISADfzaMgaMKGOW1MMOMU5JhEfW1fmQivPc8A6jDnjPfM
 ak_MCsLFkv7vhxXu96bPCtKmraei0fZK.DIZ4gACm.WSwzA6AcUzKZ_.pa5xHRvQbcWa4T_z1Zq0
 phiN8noewNal6afSzdn6znOYPrnbu8Ij1a96PosWaK.wfFa1x80SJJ2OVa6hGZlloW1xS0uUtT9T
 Von.hwRRWXVFsBl05jboL.GCiE3_m_dEvoa8fAmRz9_BUszVKoR3a4BchmI1dyhzaf2yK5XU0SPc
 M2VvpO5zye8VK6qb1eD8yD0C3nm.F093QCEHXT26.HcUsdgfkGGEcJ39aDOquaP0oQF5sFDmm6N7
 w4OhtYrnAYw__Wv.Lh79BLwBUUZCylrtWlAjysiNf2Q_3U6pJYAKmnbidBDAO9oxi7W3cs2giSmI
 x1IfRkmm5LmxrApNPduHXeDmCixjJJ_6wgf48P.6bxpWibdLY.KDMo_.c3HELaXKcmY_NLEWQBQj
 09dUoiC6Gh2sjOdJlWI96wHOkDgwUi1uuj1vM58fco9LDz8mSWLmJiEfITn6OhWe1QZCE1u6G9yV
 4qAhqb7RoWVIvawNsQskMKmmLXUn6LoMtaLngKpv5b7RONwjDdX7afFLR_dzIZXEyqT59M.nYJkE
 j4dyBjg1ucKFfLLCZLHx3qiJSkdRiMXrRKIjZP4UrkoqC1Kqbij5PPV7OwiAFS0T4K8hcM0SLbqC
 nuUUjXShI3bk7WBzr8E0pNz9myLG3iYrLniuGhWBhM3IQYx_FsnRMztnPCDU7c4zSefuMxx8sEmK
 n7_E2cSgzcD2XupKxbwbdU1mbUXGHDyREBiCH52LP5YEQsMeOpapCFFllBH0iSw8ofwQoqBm5jQD
 b4uj3OFEiFwkDZi_vozbiA4jFiwPZelj_LHgfMvkFW9vgAZPDlD4dKZm7.MD9uBLDrd5htXnoPHl
 zmbQBmA--
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 2bf46350-78c8-4953-acb6-559ab03b2771
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Mar 2025 10:46:40 +0000
Received: by hermes--production-ir2-54ff696c44-6jssk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 91984ad40146ee98a42c2f67a1c86d9e;
          Mon, 31 Mar 2025 10:16:12 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3] rust: macros: Fix macro referencing core and kernel crates 
Date: Mon, 31 Mar 2025 10:47:09 +0100
Message-ID: <20250331101325.2357367-2-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Took into account all the remarks. Hope this letter with the patch covers
all of them. 

Thanks
Igor Korotin
