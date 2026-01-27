Received: from outbound.pv.icloud.com (p-west1-cluster4-host5-snip4-6.eps.apple.com [57.103.65.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574A2FD69E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518395; cv=none; b=ngERdJLpaz6syioLdbStzTPz2who5WsfBoA2GjCmJswH5sJlDksI6HhHxT7b8qUCkP+NXCerJv5FC0InTF6PG/0zLwcyY9qwdqZtBytIhOsoTFlpcQZgtp7qVsXXMdjCeSpeXhSXAPPNBhKVRXwvdwXIXzSTJ7kSa6KqlkURUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518395; c=relaxed/simple;
	bh=XBbXHvLAGt1Vb1RO1gPrGRdrSRSKrBQozwrHwC+/glc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2Lc/FG9vML/mA7OtqwgL3VtiUrV5HNT0VKLDYmt3R87U3hhAmM9VGQulL8hmS1haLqmWt3tcNlgVCdViS0ZaTGUUpwiU31Gssp2ruQRukJPaJoEP9yeXa60Xwv/f4qKx0Js/vqW7ufDswNM29nj1im037Li2k5kbClE2x821+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=CaxY1URV; arc=none smtp.client-ip=57.103.65.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="CaxY1URV"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPS id C249E18006DC;
	Tue, 27 Jan 2026 12:53:10 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769518393; x=1772110393; bh=RFCZGKT3igqs+LniYyOh2A5gBtFBtCSkw26tIdsuAoM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CaxY1URVdsP5xIOijArDhzlcIUUjkvJuok2wdUJjoDN5I/V6joyBDSJResYeM5UQ0JEhAFNxZfyhPwttbugHUYUTfJR6cwBl2yjRDCkEbQyt+upV4bRxknxmWDIkhGEQgDYon1C+zloQ2aERn1E38OTUVYetTd6byCGjKqhESmBe85LCMZcdq11drCYLhDYUz7fHyWy6wLtA8cjFoaDsWh93IA/5SVyyVJAclVEO+p+NnqzuzFUj4nbeeZ+t8yfNEz2bhI1t0meVOS057CU9uFhzH4P+0NnoqOm76rxSteedbyl+DLBj+NEHump+tUNzvbgDyFQ/Qz9F54NzuagTUA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPSA id C32E31800415;
	Tue, 27 Jan 2026 12:53:07 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
Date: Tue, 27 Jan 2026 21:52:58 +0900
Message-ID: <20260127125300.3656544-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=MqhfKmae c=1 sm=1 tr=0 ts=6978b537
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cynmIQMnd3I5iR9wjKYA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: DEE-Jk-zceD5qlrdcffVHjo2MGd_VwcS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfXxcSLmFvio3fI
 jh7EqJ3jGyG+vWrruqAu/Njv/4+CrOIMlYzCFvZIbNDCRZBgY54pASmoAr0yN5+ltpE0jEBDHIQ
 /AN3YlnoXPUDV8zAkuUNyqNdAEvVbsCn2EmKrd8XCeFQkVK+lTpkHi439IaD0cLVnp9Ey4kfPve
 GUJQGy1bLgPpyODgyuRVWV9UogVU679e3fRdPmRWBvLVmwpZrbk6dJs6bIt9nSoVxKQPQaeCgke
 yiQ0eMrDrui7ci487CJ7vQv+pd3M21Ro7lYO6qCTPONT513AHiuSUhq3VblGKXY3uoxYVo1NqOT
 xmuAJ7avkooyz/O/oxoKeUxF9QAwRsVZuW969jNY0aLTFNo7dbZ91Mv9lanvFk=
X-Proofpoint-GUID: DEE-Jk-zceD5qlrdcffVHjo2MGd_VwcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxlogscore=363 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270105
X-JNJ: AAAAAAABaRwN/0Ax9JLwdh3KIeOhuzuy8K2qf25ZaCa+qarZug1+b97Eh6QF0ByEezLSQKTqu/1+VDdl5qyCTW5iKiXTHG5JNz2cb5mMC1QRWcP4S9oDTs5rkrTwdGBQ7yjJkdiTUva8NCR9mgnI/Ah4FSxQp+3MZM2axTjb2O33gg4waLkYjVbsPyhRcLq8/DSPqEol/NumEMrRnxIm9zOxevQHnjKPGZxVBT4ibpKsOvgxAAD/m8d90kvnGrhaC28V2uQa/J7sCIln08mfJ1ghjGLVXjaS7NYKXyWnpyWbh945EXiccB0VYrry9YAPA0+WF/JoCVUcY3dShIp5RV4HphQxf7QbjmmwGg/nwj8XVTjxQyv43TfRM2hXKhmEcZM+NGhjBnFy0duyybH0WaLLSqlZ9TRH1arRBuKhjm5yXOdyhahYpKa/Sk5VGx+5JbrxIGowZ1WnYeWfile1nHdeIUUy9ab+msvSo+AB/X99VyFprhFrkT8IfKChIXSHrhw1VReORZB5xbN/MK76nwmyYH2ub7t5U/PWO2AHul87XD5jWTZ9avZcPjnsS1MbBUQC4MQjeQZo0wYoVVLpeRk9S7ioX+5DLKMJXFoeK+aSkXW38qO8EHX9+faj7SrPLxpVIbsREu+7o6cyvSRpxw07s9Uv2fIQtPAupZKLfdLhsgFgzbNmKN4UxlMbrJo9Z6/6HSOkrjODjjEF3pbfZdsu2+J5ibzeUAxIUt3NyJkcXJxe+I/sV174x9kA1I/DvOKEK84mZjX1MhpF0jNlS1NMF3t4mRoCbuk6OgNwVpU=

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series adds AtomicFlag::get_mut to expose a bool API under exclusive
access, and switches the list atomic tracker to use AtomicFlag.

Note that I sent this patchset yesterday, but it didn't seem to be
delivered properly, so I'm resending it via a different mail
server. Hopefully it goes through this time.

v2:
- Add AtomicFlag::get_mut()
- Make AtomicTracker use get_mut()
v1: https://lore.kernel.org/rust-for-linux/20260119231757.3460885-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  rust: sync: atomic: Add AtomicFlag::get_mut
  rust: list: Use AtomicFlag in AtomicTracker

 rust/kernel/list/arc.rs              |  8 ++++----
 rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)


base-commit: ed45fc4e7712dabca517bee9f73b91e7da0030a6
-- 
2.43.0

