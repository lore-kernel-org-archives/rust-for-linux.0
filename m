Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A113A416
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Apr 2024 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313910; cv=none; b=dCwxMv8kCt+ZPVdx2pNPZ8iI6XfwerUbWRlX3d1Z7L5D5I29p/9lFuBsJghpUATg1weLz7j/IiNdF5+UQnexpe2YtIFN9FmcvoO57rmGfI/BP+hb89KxlFr2M4/PROXQyTHlQtauxqoNSofOf45jslGwy8rrG5wgwMwy6KaRkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313910; c=relaxed/simple;
	bh=YZ9zZCJR/Rz0Fqh0iGsRQCQKyXCx1u6CCFR2y1WA7nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t1+LUEosEi/eprs1t4EEuWt4zQZXm9LnGf5H2p9OOozu+nbUxzpoID9X60dOu5Ce4jBwn8p9ig+8m8cIl6vOIrU4Dqn99f/EqaoXUMpjzy3OQMYyqxQLYMzGTOw6/ItluE0Cgl+Fz6NtuegiC3+s68WHYTPumZzzsQGAR5GT74U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=r5YFmDtj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="r5YFmDtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712313907;
	bh=YZ9zZCJR/Rz0Fqh0iGsRQCQKyXCx1u6CCFR2y1WA7nA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5YFmDtjbCZpzVcORTTuKcP+wVK9yH6XxSM7hqQBeljXlJOEi8xvqnhwhwtu/qSDA
	 2t67LWJ2lcSuO/C7zt40raBSEmWhy7VPb8ETMhx2VtC4xTNj9UEmg3Fa+nV+p6WfkG
	 DxY9RO6e5TRS88DEbTRudVocxxIWb55oj76NtZtfkdUKImo1SXKGSZXi5+ynC2FiR2
	 UecjccvmCQnGENhqlnSiZqTNIrvQ78fS0ChnxePbCMe1UXiH+AJFXrzup3oVumX/MX
	 DrHP27ZIgHikJnE2zfde9HqaK/AvrC0GwsqiCTf9psD53qZGc3+eFHSRG3IdP5lepm
	 SMaA0TzBG1ufQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9E66B37813A4;
	Fri,  5 Apr 2024 10:45:04 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: kernel@valentinobst.de
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dirk.behme@de.bosch.com,
	gary@garyguo.net,
	kernel-linux@vger.kernel.org,
	kernel@collabora.com,
	laura.nao@collabora.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	usama.anjum@collabora.com,
	wedsonaf@gmail.com
Subject: Re: [PATCH v2] docs: rust: Add instructions for the Rust kselftest
Date: Fri,  5 Apr 2024 12:45:22 +0200
Message-Id: <20240405104522.271897-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240405084634.3474-1-kernel@valentinobst.de>
References: <20240405084634.3474-1-kernel@valentinobst.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Valentin,

On 4/5/24 10:46, Valentin Obst wrote:
>> Add section describing how to build and run the Rust kselftest.
>>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> 
> Hi,
> 
> thanks for clarifying the system requirements. Only minor things (see
> below), irrespective of that offering:
> 
> Reviewed-by: Valentin Obst <kernel@valentinobst.de>
> 
>> ---
>> Changes in v2:
>> - Use plural to account for potential other tests added later
>> - Omit details about the test_probe_samples test
>> - Clarify that kselftests are intended to be executed on a system running the same kernel to be tested
>> ---
>>   Documentation/rust/testing.rst | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
>> index 6658998d1b6c..64f58c4308f8 100644
>> --- a/Documentation/rust/testing.rst
>> +++ b/Documentation/rust/testing.rst
>> @@ -6,10 +6,11 @@ Testing
>>   This document contains useful information how to test the Rust code in the
>>   kernel.
>>
>> -There are two sorts of tests:
>> +There are three sorts of tests:
>>
>>   - The KUnit tests.
>>   - The ``#[test]`` tests.
>> +- The Kselftests.
>>
>>   The KUnit tests
>>   ---------------
>> @@ -133,3 +134,25 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
>>   This requires the kernel ``.config`` and downloads external repositories. It
>>   runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
>>   what these tests can test.
>> +
>> +The Kselftests
>> +--------------
>> +
>> +Kselftests are also available in the tools/testing/selftests/rust folder.
>> +
>> +The kernel config options required for the test are listed in the
> 
> Is this intentionally still in singular? Maybe replace /test/tests/?
> 

Argh, that slipped through - I'll fix it.

>> +tools/testing/selftests/rust/config file and can be included with the aid
>> +of the merge_config.sh script::
>> +
>> +	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
>> +
>> +The kselftests are built within the kernel source tree and are intended to
>> +be executed on a system that is running the same kernel.
>> +
>> +Once a kernel matching the source tree has been booted, the tests
> 
> Maybe say 'installed and booted' here since at least one test is using
> modprobe, which expects to find the modules and other things in some
> standard locations.
> 

Right, thanks for the suggestion. I'll send another version with these
couple changes applied.

Thanks,

Laura
